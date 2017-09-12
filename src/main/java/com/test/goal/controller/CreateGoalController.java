package com.test.goal.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/createGoal")
public class CreateGoalController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	// 마방진 생성화면으로 이동
	@RequestMapping(value = "MGoalSquareForm", method = RequestMethod.GET)
	public String MGoalSquareForm(HttpSession session) {
		String hostId = (String)session.getAttribute("userid");
		session.setAttribute("hostId", hostId);
		return "/createGoal/MGoalSquareForm";
	}
}
