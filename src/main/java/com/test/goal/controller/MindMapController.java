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
	public String home(Model model,HttpServletRequest request, int sectionNum, HashMap<String, Integer> mGoalNumList,int progressNum) {
		
		System.out.println(11122233);
		System.out.println("sectionNum: "+sectionNum + "mGoalNumList: " + mGoalNumList  + "progressNum: " + progressNum);
		//sectionNum, 
		
		// 넘어오자마자 클릭하거나 시작된 중간번호의 값을 받는다 (현재 로그인한 사람의 중간번호를 받음)
		int loginUserMGoalNum = mGoalNumList.get((String)request.getSession().getAttribute("userid"));
		
		MidGoalVO midGoalVO = service.findMidGoal(loginUserMGoalNum);
		model.addAttribute("midGoalVO", midGoalVO);
		model.addAttribute("btmGoalList", service.getBtmGoalList(midGoalVO));
		
		// 현재 클릭한 섹션의 넘버를 모델에 담아 페이지 이동(웅희씨에게 받아야함)
		model.addAttribute("sectionNum", sectionNum);
		model.addAttribute("loginUserMGoalNum", loginUserMGoalNum);
		
		ArrayList<MemberRecord> recordList = new ArrayList<>();
		recordList = service.getRecordList(mGoalNumList);
		model.addAttribute("recordList", recordList);
		model.addAttribute("mGoalNumList", mGoalNumList);
		model.addAttribute("progressNum",progressNum);
		
		return "/mindMap/mindMap";
	}
	
	
	@RequestMapping(value = "getBTMSection", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, ArrayList> getBTMSection(int sectionNum, int loginUserMGoalNum) {
		
		HashMap<String, ArrayList> sendInfoMap = new HashMap<>();
		
		//클릭하거나 시작된 마방진의 섹션 넘버를 받는다.
		sendInfoMap.put("BTMSectionList", service.findBTMSection(sectionNum));
		//로그인한 맴버의 중간목표 넘버
		sendInfoMap.put("BTMGoalList", service.findBTMGoal(loginUserMGoalNum));
			
		return sendInfoMap;
	}
	
	@RequestMapping(value = "getBTMRecord", method = RequestMethod.POST)
	@ResponseBody
	public HashMap<String, ArrayList> getBTMRecord(
			int progressNum,String isClick,HttpServletRequest request,String clickedNodeTitle,int clickedNodeNum,int BTMSectionNum,
			HashMap<String, Integer> mGoalNumList) {
		
		//준소쿠수 - 명예부원 (제5의 부원 조준석)
		return service.randomAllocate(mGoalNumList,progressNum,isClick,request,clickedNodeTitle,clickedNodeNum,BTMSectionNum);
	}
	
}
