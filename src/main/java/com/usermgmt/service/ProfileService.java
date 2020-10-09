package com.usermgmt.service;

import com.usermgmt.form.UpdateProfileForm;

public interface ProfileService {
	
	boolean updateProfile(UpdateProfileForm updateProfileForm, Integer id);
	
	boolean anyRequiredFieldEmpty(UpdateProfileForm updateProfileForm);

}
