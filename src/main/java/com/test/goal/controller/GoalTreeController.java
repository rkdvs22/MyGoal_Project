package com.test.goal.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.test.goal.dao.GoalTreeDAO;
import com.test.goal.vo.GoalTreeVO;

@Controller
@RequestMapping("/goalTree")
public class GoalTreeController {
	
	@Autowired
	private GoalTreeDAO dao;
	
	//최상위 목표 불러오기
	@RequestMapping(value = "goalList", method = RequestMethod.GET)
	public String goalList(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		
		Date sysdate = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy");
		String tStartYear = sdf.format(sysdate);
		System.out.println("tStartYear = " + tStartYear);
		ArrayList<GoalTreeVO> goalList = dao.goalList(userid, tStartYear);
		
		model.addAttribute("goalList", goalList);
		model.addAttribute("goalNum", goalList.size());
		return "/goalTree/goalTree";
	}
	
}
