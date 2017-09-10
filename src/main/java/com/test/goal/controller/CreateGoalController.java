package com.test.goal.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.test.goal.dao.MessageDAO;
import com.test.goal.vo.MessageVO;

@Controller
@RequestMapping("/createGoal")
public class CreateGoalController {

	// 마방진 생성화면으로 이동
	@RequestMapping(value = "MGoalSquareForm", method = RequestMethod.GET)
	public String MGoalSquareForm() {
		return "/createGoal/MGoalSquareForm";
	}
}
