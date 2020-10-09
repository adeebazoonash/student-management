package com.usermgmt.service;

import java.util.List;

import com.usermgmt.model.History;
import com.usermgmt.model.User;

public interface HistoryService {
	
	void addActivityHistory(User user, String email, String activity);
	
	List<History> getAllHistory();
	
	List<History> getHistoryByUser(User user);

}
