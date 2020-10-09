package com.usermgmt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.usermgmt.form.ChangePasswordForm;
import com.usermgmt.form.ForgotPasswordForm;
import com.usermgmt.form.UpdateProfileForm;
import com.usermgmt.model.DeleteUser;
import com.usermgmt.model.User;
import com.usermgmt.service.HistoryService;
import com.usermgmt.service.UserService;

@Controller
@RequestMapping("/app")
public class UserController {

	private static final String PASSWORD_CHANGE = "PASSWORD_CHANGE";

	private static final String PASSWORD_RESET = "PASSWORD_RESET";

	private static final String DELETE_USER = "DELETED_USER";

	private static final String UPDATE_USER = "UPDATED_USER";

	@Autowired
	UserService userService;

	@Autowired
	HistoryService historyService;

	@RequestMapping("/users")
	public ModelAndView users(HttpSession session) {
		ModelAndView mav = null;
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
			mav = new ModelAndView("users");
			List<User> allUsers = userService.getAllUsers();
			if (!CollectionUtils.isEmpty(allUsers)) {
				mav.addObject("allUsers", allUsers);
			}
		} else {
			mav = new ModelAndView("error");
		}
		return mav;
	}

	@RequestMapping("/changePassword")
	public ModelAndView passwordChange(HttpSession session) {
		ModelAndView mav = null;
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("CLIENT")) {
			mav = new ModelAndView("changepwClient");
		} else if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
			mav = new ModelAndView("changepwAdmin");
		} else {
			mav = new ModelAndView("error");
		}
		return mav;

	}

	@RequestMapping("/changePassword/submit")
	public ModelAndView passwordChangeSubmit(@ModelAttribute("changePassword") ChangePasswordForm changePasswordForm,
			HttpSession session) {
		ModelAndView mav = null;
		User loggedInUser = (User) session.getAttribute("loggedInUser");

		if (loggedInUser == null) {
			mav = new ModelAndView("error");
			return mav;
		}

		String email = changePasswordForm.getEmail();
		String password = changePasswordForm.getPassword();
		String newPassword = changePasswordForm.getNewPassword();
		String confirmPassword = changePasswordForm.getConfirmPassword();

		if (StringUtils.isEmpty(email) && StringUtils.isEmpty(password) && StringUtils.isEmpty(newPassword)
				&& StringUtils.isEmpty(confirmPassword)) {
			if (loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
				mav = new ModelAndView("changepwAdmin");
			} else {
				mav = new ModelAndView("changepwClient");
			}
			mav.addObject("pwChangeMsg", "Please fill the form and submit");
			return mav;

		}

		if ((StringUtils.isEmpty(email) || StringUtils.isEmpty(password))) {
			if (loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
				mav = new ModelAndView("changepwAdmin");
			} else {
				mav = new ModelAndView("changepwClient");
			}
			mav.addObject("pwChangeMsg", "Invalid Credentials");
			return mav;
		}

		User existingUser = null;
		if ((!StringUtils.isEmpty(email) && !StringUtils.isEmpty(password))) {
			existingUser = userService.findUserByEmailAndPassword(changePasswordForm);
			if (null == existingUser.getId()) {
				if (loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
					mav = new ModelAndView("changepwAdmin");
				} else if (loggedInUser.getRole().equalsIgnoreCase("CLIENT")) {
					mav = new ModelAndView("changepwClient");
				}
				mav.addObject("pwChangeMsg", "Invalid Credentials");
				return mav;
			}
		}

		if (loggedInUser.getId() != existingUser.getId()) {
			if (loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
				mav = new ModelAndView("changepwAdmin");
			} else if (loggedInUser.getRole().equalsIgnoreCase("CLIENT")) {
				mav = new ModelAndView("changepwClient");
			}
			mav.addObject("pwChangeMsg", "Invalid Credentials");
			return mav;
		}

		if (StringUtils.isEmpty(newPassword) || StringUtils.isEmpty(confirmPassword)) {
			if (loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
				mav = new ModelAndView("changepwAdmin");
			} else {
				mav = new ModelAndView("changepwClient");
			}
			mav.addObject("pwChangeMsg", "Passwords should match");
			return mav;
		}

		boolean passwordAndConfirmPasswordSame = userService.isPasswordAndConfirmPasswordSame(newPassword,
				confirmPassword);
		if (!passwordAndConfirmPasswordSame) {
			if (loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
				mav = new ModelAndView("changepwAdmin");
			} else {
				mav = new ModelAndView("changepwClient");
			}
			mav.addObject("pwChangeMsg", "Passwords do not match");
			return mav;
		}

		boolean updatedPassword = userService.updatePassword(newPassword, email);
		historyService.addActivityHistory(loggedInUser, null, PASSWORD_CHANGE);
		if (updatedPassword) {
			session.removeAttribute("loggedInUser");
			session.invalidate();
			mav = new ModelAndView("login");
			mav.addObject("pwUpdatedSuccess", "Password Updated, login to continue");
		}
		return mav;
	}

	@RequestMapping("/forgotPassword")
	public ModelAndView forgotPassword(HttpSession session) {
		ModelAndView mav = null;
		mav = new ModelAndView("forgotPassword");
		return mav;
	}

	@RequestMapping("/forgotPassword/submit")
	public ModelAndView forgotPasswordSubmit(
			@ModelAttribute("forgotPasswordForm") ForgotPasswordForm forgotPasswordForm) {
		ModelAndView mav = new ModelAndView("forgotPassword");
		boolean passwordAndConfirmPasswordSame = userService.isPasswordAndConfirmPasswordSame(
				forgotPasswordForm.getNewPassword(), forgotPasswordForm.getConfirmPassword());
		User existingUser = userService.findUserByEmail(forgotPasswordForm.getEmail());
		if (existingUser == null || existingUser.getId() == null) {
			mav.addObject("pwChangeMsg", "Email does not exist");
			return mav;
		}
		if (!passwordAndConfirmPasswordSame) {
			mav.addObject("pwChangeMsg", "Passwords do not match");
			return mav;
		}
		boolean checkAnswers = userService.checkAnswers(existingUser, forgotPasswordForm);
		if (checkAnswers) {
			mav = new ModelAndView("login");
			userService.updatePassword(forgotPasswordForm.getNewPassword(), forgotPasswordForm.getEmail());
			historyService.addActivityHistory(existingUser, null, PASSWORD_RESET);
			mav.addObject("pwUpdatedSuccess", "Password has been changed, please login to continue");
		} else {
			mav.addObject("pwChangeMsg", "Answers may be incorrect, please check and try again");
		}
		return mav;
	}

	@RequestMapping("/user/delete")
	public ModelAndView deleteUser(@ModelAttribute("deleteUser") DeleteUser user, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		ModelAndView mav = new ModelAndView();
		if (loggedInUser != null && loggedInUser.getId() != user.getDeleteUserId()) {
			userService.deleteUser(user.getDeleteUserId());
			historyService.addActivityHistory(loggedInUser, user.getEmail(), DELETE_USER);
		}
		mav.setView(new RedirectView("/app/users", true, true, false));
		return mav;
	}

	@RequestMapping("/user/edit")
	public ModelAndView editUser(@RequestParam("id") Integer id, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		ModelAndView mav = new ModelAndView("editUser");
		if (loggedInUser == null) {
			mav = new ModelAndView("error");
			return mav;
		}
		User existingUser = userService.findUserById(id);
		mav.addObject("existingUser", existingUser);
		return mav;
	}

	@RequestMapping("/user/edit/submit")
	public ModelAndView submitEditUser(@ModelAttribute("updateProfileForm") UpdateProfileForm updateProfileForm,
			@RequestParam("id") Integer id, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		boolean checkRequiredFieldsEmpty = userService.checkRequiredFields(updateProfileForm);
		if (!checkRequiredFieldsEmpty) {
			boolean updated = userService.updateUserDetails(updateProfileForm, id);
			if (updated) {
				historyService.addActivityHistory(loggedInUser, updateProfileForm.getEmail(), UPDATE_USER);
			}
		}
		ModelAndView mav = new ModelAndView();
		mav.setView(new RedirectView("/app/users", true, true, false));
		return mav;
	}

}
