package com.usermgmt.serviceImpl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.usermgmt.dao.UserDaoImpl;
import com.usermgmt.form.ChangePasswordForm;
import com.usermgmt.form.ForgotPasswordForm;
import com.usermgmt.form.UpdateProfileForm;
import com.usermgmt.model.User;
import com.usermgmt.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	UserDaoImpl userDao;

	public List<User> getAllUsers() {
		List<User> allUsers = userDao.getAllUsers();
		return allUsers;
	}

	@Override
	public boolean isPasswordAndConfirmPasswordSame(String newPassword, String confirmPassword) {
		boolean isSame = false;
		if (!StringUtils.isEmpty(newPassword) && !StringUtils.isEmpty(confirmPassword)) {
			if (newPassword.equalsIgnoreCase(confirmPassword)) {
				isSame = true;
			}
		}
		return isSame;
	}

	@Override
	public boolean updatePassword(String newPassword, String email) {
		boolean updated = false;
		try {
			userDao.updatePassword(newPassword, email);
			updated = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updated;
	}

	@Override
	public User findUserByEmailAndPassword(ChangePasswordForm changePasswordForm) {
		User existingUser = userDao.findByEmailAndPassword(changePasswordForm.getEmail(),
				changePasswordForm.getPassword());
		return existingUser;
	}

	@Override
	public User findUserByEmail(String email) {
		User existingUser = userDao.findByEmail(email);
		return existingUser;
	}

	@Override
	public boolean checkAnswers(User existingUser, ForgotPasswordForm forgotPasswordForm) {
		boolean checkAnswer = false;
		String ans1 = forgotPasswordForm.getAns1();
		String ans2 = forgotPasswordForm.getAns2();
		if (existingUser.getAns1().equalsIgnoreCase(ans1) && existingUser.getAns2().equalsIgnoreCase(ans2)) {
			checkAnswer = true;
		}
		return checkAnswer;
	}

	@Override
	public void deleteUser(Integer deleteUserId) {
		try {
			userDao.deleteUser(deleteUserId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	@Override
	public User findUserById(Integer id) {
		User user = userDao.findById(id);
		return user;
	}

	@Override
	public boolean updateUserDetails(UpdateProfileForm updateProfileForm, Integer id) {
		boolean updated = false;
		try {
			userDao.updateUserInfo(updateProfileForm.getFirstName(), updateProfileForm.getLastName(),
					updateProfileForm.getMiddleName(), updateProfileForm.getEmail(), id);
			updated = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updated;
	}

	@Override
	public boolean checkRequiredFields(UpdateProfileForm updateProfileForm) {
		if (StringUtils.isEmpty(updateProfileForm.getFirstName())
				|| StringUtils.isEmpty(updateProfileForm.getLastName())
				|| StringUtils.isEmpty(updateProfileForm.getEmail())) {
			return true;
		}
		return false;
	}
}
