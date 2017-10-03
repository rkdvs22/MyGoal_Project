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

import com.test.goal.service.MindMapService;
import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.BTMSectionVO;
import com.test.goal.vo.MemberRecord;
import com.test.goal.vo.MidGoalVO;
import com.sun.xml.internal.bind.v2.schemagen.xmlschema.List;

/**
 * Handles requests for the application home page.
 */
@Controller
@RequestMapping("/mind")
public class MindMapController {
	
	@Autowired
	private MindMapService service;
	
	@RequestMapping(value = "mindMap", method = RequestMethod.GET)
	public String home(Model model,HttpServletRequest request) {
		
		MidGoalVO midGoalVO = service.findMidGoal(101);
		model.addAttribute("midGoalVO", midGoalVO);
		model.addAttribute("btmGoalList", service.getBtmGoalList(midGoalVO));
		HashMap<String, Integer> MemberGoalNum = new HashMap<>();
		
		MemberGoalNum.put("권근택", 101);
		MemberGoalNum.put("조준석", 102);
		MemberGoalNum.put("이유정", 103);
		MemberGoalNum.put("高橋", 104);
		ArrayList<MemberRecord> recordList = new ArrayList<>();
		recordList = service.getRecordList(MemberGoalNum);
		model.addAttribute("recordList", recordList);
		request.getSession().setAttribute("loginUser", "高橋");
		
		return "/mindMap/mindMap";
	}
	
	@RequestMapping(value = "getBTMSection", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, ArrayList> getBTMSection() {
		
		HashMap<String, ArrayList> sendInfoMap = new HashMap<>();
		
		sendInfoMap.put("BTMSectionList", service.findBTMSection(26));
		sendInfoMap.put("BTMGoalList", service.findBTMGoal(104));
			
		return sendInfoMap;
	}
	
	@RequestMapping(value = "getBTMRecord", method = RequestMethod.GET)
	@ResponseBody
	public HashMap<String, ArrayList> getBTMRecord(int progressNum,String isClick,HttpServletRequest request,String clickedNodeTitle,int clickedNodeNum,int BTMSectionNum) {
		
		HashMap<String, Integer> MemberGoalNum = new HashMap<>();
		MemberGoalNum.put("권근택", 101);
		MemberGoalNum.put("조준석", 102);
		MemberGoalNum.put("이유정", 103);
		MemberGoalNum.put("高橋", 104);
		
		//준소쿠수 - 명예부원 (제5의 부원 조준석)
		return service.randomAllocate(MemberGoalNum,progressNum,isClick,request,clickedNodeTitle,clickedNodeNum,BTMSectionNum);
	}
	
}
