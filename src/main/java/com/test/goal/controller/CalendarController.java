package com.test.goal.controller;



import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.goal.service.CalendarService;
import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.DayRecordVO;

@Controller
@RequestMapping("/calendar")
public class CalendarController {
	
	@Autowired
	private CalendarService service;
	
	@RequestMapping(value = "calendar", method = RequestMethod.GET)
	public String openCalendar(Model model,HttpServletRequest request) {
		String memberId = (String) request.getSession().getAttribute("userid");
		ArrayList<BTMRecordVO> isProcessingRecordList = service.getIsProcessingRecord(memberId);  
		model.addAttribute("isProcessingRecordList", isProcessingRecordList);
		return "/calendar/calendar";
	}
	
	
	@RequestMapping(value = "getCalendarInfo", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<BTMRecordVO> getCalendarInfo(HttpServletRequest request) {
		
		ArrayList<BTMRecordVO> BTMRecordlist = new ArrayList<>();
		BTMRecordlist = service.getRecordList((String)request.getSession().getAttribute("userid"));
		
		return BTMRecordlist;
	}
	
	@RequestMapping(value = "getChartRecord", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<DayRecordVO> getChartRecord(HttpServletRequest request, int BTMRecordNum) {
		
		String memberId = (String) request.getSession().getAttribute("userid");
		ArrayList<DayRecordVO> DayRecordList = new ArrayList<>();
		DayRecordList = service.getChartRecord(BTMRecordNum,memberId);
		
		return DayRecordList;
	}
}
