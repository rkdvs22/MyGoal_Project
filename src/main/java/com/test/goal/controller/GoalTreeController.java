package com.test.goal.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.goal.dao.GoalTreeDAO;
import com.test.goal.vo.TopGoalVO;

@Controller
@RequestMapping("/goalTree")
public class GoalTreeController {
	
	@Autowired
	private GoalTreeDAO dao;
	
	//최상위 목표 불러오기
	@RequestMapping(value = "goalList", method = RequestMethod.GET)
	public String goalList(HttpSession session, Model model, 
		@RequestParam(value = "year", defaultValue = "2017") String year,
		int key) {
		
		HashMap<String, String> map = new HashMap<>();
		String userid = (String) session.getAttribute("userid");
		map.put("userid", userid);
		map.put("year", year);
		ArrayList<TopGoalVO> goalList = dao.goalList(map);

		model.addAttribute("goalYear", year);
		model.addAttribute("goalList", goalList);
		model.addAttribute("goalNum", goalList.size());
		if(key == 1){
			model.addAttribute("key", 1);
		}
		
		return "/goalTree/goalTree";
	}
	
}
