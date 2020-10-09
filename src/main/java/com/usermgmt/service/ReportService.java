package com.usermgmt.service;

import java.util.List;

import com.usermgmt.form.ReportForm;
import com.usermgmt.model.Report;

public interface ReportService {

	List<Report> getDataBetweenDates(ReportForm reportForm);
	

}
