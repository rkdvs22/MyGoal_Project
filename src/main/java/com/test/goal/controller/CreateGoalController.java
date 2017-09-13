package com.test.goal.controller;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.goal.dao.CreateGoalDAO;
import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.TopGoalVO;

@Controller
@RequestMapping("/createGoal")
public class CreateGoalController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CreateGoalDAO dao;
	
	// 마방진 생성화면으로 이동
	@RequestMapping(value = "MGoalSquareForm", method = RequestMethod.GET)
	public String MGoalSquareForm(HttpSession session) {
		String hostId = (String)session.getAttribute("userid");
		session.setAttribute("hostId", hostId);
		return "/createGoal/MGoalSquareForm";
	}
	
	// 목표大작성화면 이동
	@RequestMapping(value = "createForm", method = RequestMethod.GET)
	public String createForm() {
		return "/createGoal/create";
	}
	
	// 목표大작성 기능
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(TopGoalVO tvo, MainProgressVO mvo, Map<String, String> map, RedirectAttributes rttr) {
		map.put("create1", dao.create1(tvo));
		map.put("create2", dao.create2(mvo));
		System.out.println(map);
		rttr.addFlashAttribute("createGoal", map);
		/*rttr.addFlashAttribute("topGoal", dao.create1(tvo));
		rttr.addFlashAttribute("mainProgress", dao.create2(mvo));*/
		return "redirect:/";
	}
}
