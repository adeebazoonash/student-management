package com.usermgmt.serviceImpl;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.usermgmt.dao.HistoryDao;
import com.usermgmt.form.ReportForm;
import com.usermgmt.model.Report;
import com.usermgmt.service.ReportService;

@Service
public class ReportServiceImpl implements ReportService {
	
	@Autowired
	HistoryDao historyDao;
	

	@Override
	public List<Report> getDataBetweenDates(ReportForm reportForm) {
		List<Report> report = null;
		try {
			report = historyDao.getReport(reportForm.getFrom(), reportForm.getTo());
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return report;
	}

}
