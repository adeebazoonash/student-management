
package com.usermgmt.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usermgmt.dao.UserDaoImpl;
import com.usermgmt.form.LoginForm;
import com.usermgmt.model.User;
import com.usermgmt.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

	@Autowired
	UserDaoImpl userDao;

	@Override
	public User findByEmailAndPassword(LoginForm loginForm) {
		User user = null;
		if (null != loginForm.getEmail() && null != loginForm.getPassword()) {
			user = userDao.findByEmailAndPassword(loginForm.getEmail(), loginForm.getPassword());
		}
		return user;
	}
}