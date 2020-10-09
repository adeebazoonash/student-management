package com.usermgmt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.usermgmt.form.ReportForm;
import com.usermgmt.model.Report;
import com.usermgmt.model.User;
import com.usermgmt.service.ReportService;

@Controller
@RequestMapping("/app")
public class ReportController {

	@Autowired
	ReportService reportService;

	@RequestMapping("/report")
	public ModelAndView displayReportPage(HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		ModelAndView mav = new ModelAndView("report");
		if (loggedInUser == null) {
			mav = new ModelAndView("error");
			return mav;
		}
		return mav;
	}

	@RequestMapping("/report/display")
	public ModelAndView displayReportData(@ModelAttribute("reportForm") ReportForm reportForm, HttpSession session) {
		User loggedInUser = (User) session.getAttribute("loggedInUser");
		ModelAndView mav = new ModelAndView("report");
		if (loggedInUser == null) {
			mav = new ModelAndView("error");
			return mav;
		}

		if (StringUtils.isEmpty(reportForm.getFrom()) && StringUtils.isEmpty(reportForm.getTo())) {
			mav = new ModelAndView("report");
			mav.addObject("msg", "All fields are required");
			return mav;
		}

		List<Report> report = reportService.getDataBetweenDates(reportForm);
		if (CollectionUtils.isEmpty(report)) {
			mav.addObject("msg", "No records found");
		} else {
			mav.addObject("report", report);
		}
		return mav;
	}

}
