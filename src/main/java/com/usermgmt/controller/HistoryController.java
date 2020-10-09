package com.usermgmt.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.usermgmt.model.History;
import com.usermgmt.model.User;
import com.usermgmt.service.HistoryService;

@Controller
@RequestMapping("/app")
public class HistoryController {
	@Autowired
	HistoryService historyService;

	@RequestMapping("/history")
	public ModelAndView view(HttpSession session) {
		ModelAndView mav = null;
		User user = (User) session.getAttribute("loggedInUser");
		if (user == null) {
			mav = new ModelAndView("error");
		} else if (user != null && user.getRole().equalsIgnoreCase("ADMIN")) {
			mav = new ModelAndView("historyAdmin");
			List<History> allHistory = historyService.getAllHistory();
			if (!CollectionUtils.isEmpty(allHistory)) {
				mav.addObject("allHistory", allHistory);
			}
		} else {
			mav = new ModelAndView("historyClient");
			List<History> allHistory = historyService.getHistoryByUser(user);
			if (!CollectionUtils.isEmpty(allHistory)) {
				mav.addObject("allHistory", allHistory);
			}

		}
		return mav;
	}
}
