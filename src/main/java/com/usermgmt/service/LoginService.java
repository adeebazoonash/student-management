package com.usermgmt.service;

import com.usermgmt.form.LoginForm;
import com.usermgmt.model.User;

public interface LoginService {
	
	User findByEmailAndPassword(LoginForm loginForm);

}
