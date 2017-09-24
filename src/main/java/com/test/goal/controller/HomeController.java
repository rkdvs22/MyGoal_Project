package com.test.goal.controller;

import java.util.Locale;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.test.goal.dao.HomeDAO;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

	@Autowired
	private HomeDAO dao;
	
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		
		if (userid != null) {		
			model.addAttribute("homeBoard", dao.homeBoard());
			model.addAttribute("homeMessage", dao.homeMessage(userid));
		}
		return "home";
	}	
}
