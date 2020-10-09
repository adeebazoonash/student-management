package com.usermgmt.service;

import java.util.List;

import com.usermgmt.form.ChangePasswordForm;
import com.usermgmt.form.ForgotPasswordForm;
import com.usermgmt.form.UpdateProfileForm;
import com.usermgmt.model.User;

public interface UserService {
	
	List<User> getAllUsers();
	
	boolean isPasswordAndConfirmPasswordSame(String newPassword, String confirmPassword);
	
	boolean updatePassword(String newPassword, String email);
	
	User findUserByEmailAndPassword(ChangePasswordForm changePasswordform);
	
	User findUserByEmail(String email);
	
	User findUserById(Integer id);

	boolean checkAnswers(User existingUser, ForgotPasswordForm forgotPasswordForm);
	
	void deleteUser(Integer deleteUserId);

	boolean updateUserDetails(UpdateProfileForm updateProfileForm, Integer id);

	boolean checkRequiredFields(UpdateProfileForm updateProfileForm);

}

