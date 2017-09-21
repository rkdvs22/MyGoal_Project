package com.test.goal.controller;



import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.goal.service.CalendarService;
import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.DayPlanVO;
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
	public HashMap<String, ArrayList> getCalendarInfo(HttpServletRequest request) {
		
		ArrayList<BTMRecordVO> BTMRecordlist = new ArrayList<>();
		ArrayList<DayPlanVO> DayRecordlist = new ArrayList<>();
		ArrayList<DayPlanVO> nomallist = new ArrayList<>();
		HashMap<String, ArrayList> getRecordMap = new HashMap<>();
		
		BTMRecordlist = service.getRecordList((String)request.getSession().getAttribute("userid"));
		DayRecordlist= service.getDayRecordList((String)request.getSession().getAttribute("userid"));
		nomallist = service.getNomalPlanlist((String)request.getSession().getAttribute("userid"));
		
		getRecordMap.put("BTMRecordlist", BTMRecordlist);
		getRecordMap.put("DayRecordlist", DayRecordlist);
		getRecordMap.put("nomallist", nomallist);
		
		return getRecordMap;
	}
	
	@RequestMapping(value = "getChartRecord", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<DayRecordVO> getChartRecord(HttpServletRequest request, int BTMRecordNum) {
		
		String memberId = (String) request.getSession().getAttribute("userid");
		ArrayList<DayRecordVO> DayRecordList = new ArrayList<>();
		DayRecordList = service.getChartRecord(BTMRecordNum,memberId);
		
		return DayRecordList;
	}
	
	@RequestMapping(value = "deleteDayPlan", method = RequestMethod.POST)
	@ResponseBody
	public void deleteDayPlan(int dayPlanNum) {
		service.deleteDayPlan(dayPlanNum);
	}
	
	@RequestMapping(value = "updateDayPlan", method = RequestMethod.POST)
	@ResponseBody
	public void updateDayPlan(DayPlanVO vo) {
		
		service.updateDayPlan(vo);
	}
	
	@RequestMapping(value = "createDayPlan", method = RequestMethod.POST)
	@ResponseBody
	public int createDayPlan(DayPlanVO vo, HttpServletRequest request) {
		
		String userId  = (String) request.getSession().getAttribute("userid");
		vo.setUserId(userId);
		
		return service.createDayPlan(vo);
	}
}
