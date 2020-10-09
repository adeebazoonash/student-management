package com.usermgmt.serviceImpl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usermgmt.dao.HistoryDao;
import com.usermgmt.model.History;
import com.usermgmt.model.User;
import com.usermgmt.service.HistoryService;

@Service
public class HistoryServiceImpl implements HistoryService {

	@Autowired
	HistoryDao historyDao;

	@Override
	public void addActivityHistory(User user, String email, String activity) {
		historyDao.saveActivityHistory(user, email, activity);
	}

	@Override
	public List<History> getAllHistory() {
		List<History> history = null;
		try {
			history = historyDao.getHistory();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return history;
	}

	@Override
	public List<History> getHistoryByUser(User user) {
		List<History> history = null;
		try {
			history = historyDao.getHistoryByUser(user);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return history;
	}

}
