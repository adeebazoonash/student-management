package com.usermgmt.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.usermgmt.form.RegistrationForm;
import com.usermgmt.model.User;
import com.usermgmt.service.HistoryService;
import com.usermgmt.service.RegistrationService;
import com.usermgmt.service.UserService;

@Controller
@RequestMapping("/app")
@Validated
public class RegistrationController {
	
	private final static String ADDED_USER = "ADDED_USER";
	
	private final static String REGISTERED = "REGISTERED";

	@Autowired
	RegistrationService registrationService;
	
	@Autowired 
	HistoryService historyService;
	
	@Autowired 
	UserService userService;

	@RequestMapping("/register")
	public ModelAndView register() {
		ModelAndView mav = new ModelAndView("register");
		return mav;
	}

	@RequestMapping("/newuser")
	public ModelAndView registerNewUser(HttpSession session) {
		ModelAndView mav = null;
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
			mav = new ModelAndView("newuser");
		} else {
			mav = new ModelAndView("login");
		}
		return mav;
	}

	@RequestMapping("/submit")
	public ModelAndView submitForm(@ModelAttribute("registrationForm") @Valid RegistrationForm registrationForm,
			BindingResult result, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		ModelAndView mav = new ModelAndView("register");
		if (result.hasErrors()) {
			return mav;
		} else {
			boolean isSame = registrationService.isPasswordAndConfirmPasswordSame(registrationForm);
			if (!isSame && loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
				mav = new ModelAndView("newuser");
				mav.addObject("pwMsg", "Passwords do not match");
			} else if (!isSame && loggedInUser == null) {
				mav.addObject("pwMsg", "Passwords do not match");
			} else {
				if (loggedInUser != null && loggedInUser.getRole().equalsIgnoreCase("ADMIN")) {
					mav = new ModelAndView("users");
					boolean saveUser = registrationService.saveUser(registrationForm, loggedInUser);
					if (!saveUser) {
						mav = new ModelAndView("newuser");
						mav.addObject("regMsg", "Email has already been taken");
					} else {
						historyService.addActivityHistory(loggedInUser, registrationForm.getEmail(), ADDED_USER);
						mav.setView(new RedirectView("/app/users", true, true, false));
					}
				} else {
					boolean saveUser = registrationService.saveUser(registrationForm, loggedInUser);
					if (!saveUser) {
						mav = new ModelAndView("register");
						mav.addObject("regMsg", "Email has already been taken");
					} else {
						mav = new ModelAndView("login");
						mav.addObject("regSuccess", "You have been registered successfully, Please Log In to continue.");
						User newRegistrant = userService.findUserByEmail(registrationForm.getEmail());
						historyService.addActivityHistory(newRegistrant, registrationForm.getEmail(), REGISTERED);
					}
				}
			}

			return mav;
		}
	}
}
