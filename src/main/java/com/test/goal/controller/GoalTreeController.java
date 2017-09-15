package com.test.goal.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.test.goal.dao.GoalTreeDAO;
import com.test.goal.vo.TopGoalVO;

@Controller
@RequestMapping("/goalTree")
public class GoalTreeController {
	
	@Autowired
	private GoalTreeDAO dao;
	
	//최상위 목표 불러오기
	@RequestMapping(value = "goalList", method = RequestMethod.GET)
	public String goalList(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		ArrayList<TopGoalVO> goalList = dao.goalList(userid);
		
		model.addAttribute("goalList", goalList);
		model.addAttribute("goalNum", goalList.size());
		
System.out.println(goalList);			
		return "/goalTree/goalTree";
	}
	
}
