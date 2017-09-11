package com.test.goal.controller;


import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.goal.service.CalendarService;
import com.test.goal.service.MindMapService;
import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.BTMSectionVO;
import com.test.goal.vo.MemberRecord;
import com.test.goal.vo.MidGoalVO;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private CalendarService service;
	
	@RequestMapping(value = "calendar", method = RequestMethod.GET)
	public String openCalendar(HttpServletRequest request,Model model) {
		ArrayList<BTMRecordVO> BTMRecordlist = new ArrayList<>();
		System.out.println();
		BTMRecordlist = service.getRecordList((String)request.getSession().getAttribute("userid"));
		model.addAttribute("BTMRecordlist", BTMRecordlist);
		
		return "/calendar/calendar";
	}
	
	
	@RequestMapping(value = "getCalendarInfo", method = RequestMethod.POST)
	@ResponseBody
	public int getCalendarInfo() {
			
		return 0;
	}
	
	
}
