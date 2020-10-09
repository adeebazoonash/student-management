package com.usermgmt.serviceImpl;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.usermgmt.dao.UserDaoImpl;
import com.usermgmt.form.UpdateProfileForm;
import com.usermgmt.service.ProfileService;

@Service
public class ProfileServiceImpl implements ProfileService {

	@Autowired
	UserDaoImpl userDao;

	@Override
	public boolean updateProfile(UpdateProfileForm updateProfileForm, Integer id) {
		boolean updated = false;
		try {
			userDao.updateUser(updateProfileForm.getFirstName(), updateProfileForm.getLastName(),
					updateProfileForm.getMiddleName(), updateProfileForm.getEmail(), updateProfileForm.getAns1(),
					updateProfileForm.getAns2(), id);
			updated = true;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return updated;
	}

	@Override
	public boolean anyRequiredFieldEmpty(UpdateProfileForm updateProfileForm) {
		if (StringUtils.isEmpty(updateProfileForm.getFirstName())
				|| StringUtils.isEmpty(updateProfileForm.getLastName())
				|| StringUtils.isEmpty(updateProfileForm.getEmail()) 
				|| StringUtils.isEmpty(updateProfileForm.getAns1())
				|| StringUtils.isEmpty(updateProfileForm.getAns2())) {
			return true;
		}
		return false;
	}

}
