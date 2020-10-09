package com.usermgmt.service;

import com.usermgmt.form.RegistrationForm;
import com.usermgmt.model.User;

public interface RegistrationService {

	public boolean isPasswordAndConfirmPasswordSame(RegistrationForm registrationForm);

	public boolean saveUser(RegistrationForm form, User loggedInUser);

}
