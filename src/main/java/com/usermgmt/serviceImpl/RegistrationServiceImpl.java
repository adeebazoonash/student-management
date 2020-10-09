package com.usermgmt.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usermgmt.dao.UserDaoImpl;
import com.usermgmt.form.RegistrationForm;
import com.usermgmt.model.User;
import com.usermgmt.service.RegistrationService;

@Service
public class RegistrationServiceImpl implements RegistrationService {

	@Autowired
	UserDaoImpl userDao;

	@Override
	public boolean isPasswordAndConfirmPasswordSame(RegistrationForm registrationForm) {
		boolean isSame = false;
		if (registrationForm != null && null != registrationForm.getPass1() && null != registrationForm.getPass2()) {
			if (registrationForm.getPass1().equalsIgnoreCase(registrationForm.getPass2())) {
				isSame = true;
			}
		}
		return isSame;
	}

	public boolean saveUser(RegistrationForm form, User loggedInUser) {
		boolean userSaved = false;
		User existingUser = userDao.findByEmail(form.getEmail());
		if (existingUser.getFirstName() == null) {
			userDao.saveUser(form, loggedInUser);
			userSaved = true;
		}
		return userSaved;
	}

}
