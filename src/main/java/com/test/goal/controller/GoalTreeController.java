package com.test.goal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.goal.dao.CreateGoalDAO;
import com.test.goal.dao.GoalTreeDAO;
import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.MemberListVO;
import com.test.goal.vo.TopGoalVO;

@Controller
@RequestMapping("/goalTree")
public class GoalTreeController {
	
	@Autowired
	private GoalTreeDAO dao;
	@Autowired
	private CreateGoalDAO goal_dao;
	
	//최상위 목표 불러오기
	@RequestMapping(value = "goalList", method = RequestMethod.GET)
	public String goalList(HttpSession session, Model model, 
		@RequestParam(value = "year", defaultValue = "2017") String year, int key) {
		
		HashMap<String, String> map = new HashMap<>();
		String userid = (String) session.getAttribute("userid");
		map.put("userid", userid);
		map.put("year", year);
		List<TopGoalVO> goalList = dao.goalList(map);
		
		model.addAttribute("goalYear", year);
		model.addAttribute("goalList", goalList);
		model.addAttribute("goalNum", goalList.size());
		if(key == 1){
			model.addAttribute("key", 1);
		}
		
		return "/goalTree/goalTree";
	}
	
	/*
	// 목표를 선택할 시 그에 맞는 마방진으로 이동한다. (이웅희)
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "treeToGoal", method = RequestMethod.GET)
	public String treeToGoal(int goalNum, Model model, HttpSession session, Map<String, Object> map) {
		Map<String, Object> result_map = goal_dao.treeToGoal(goalNum);
		model.addAttribute("b_info", (BoardVO)result_map.get("b_info"));
		model.addAttribute("tGoal_list", (ArrayList<TopGoalVO>)result_map.get("tGoal_list"));
		model.addAttribute("progress_info", (MainProgressVO)result_map.get("progress_info"));
		model.addAttribute("member_list", (ArrayList<MemberListVO>)result_map.get("member_list"));
		
		return "/createGoal/MGoalSquareForm";
	}
	*/
	
	// 마방진 이동 (이유정)
	@RequestMapping(value = "treeToGoal", method = RequestMethod.GET)
	public String treeToGoal(int tGoalNum, Model model) {
		model.addAttribute("topGoal", dao.topGoalList(tGoalNum)); //최상위 목표 정보 전달
		model.addAttribute("midGoal", dao.midGoalList(tGoalNum)); //중간 목표 정보 전달
		
		ArrayList<MemberListVO> memberList = dao.memberList(tGoalNum);
		for (MemberListVO mvo : memberList) {
			if (mvo.getColor() == null) {
				mvo.setColor("black"); //색상 미지정시 검정색으로 전달
			}
		}
		
		model.addAttribute("memberList", memberList); //참여 멤버 정보 전달
		return "/createGoal/MGoalSquareForm2";
	}
}
