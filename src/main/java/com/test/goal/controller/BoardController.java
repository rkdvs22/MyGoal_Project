package com.test.goal.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.test.goal.dao.BoardDAO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardDAO dao;
	
	// 게시글 목록
	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList(Model model, int tGoalNum) {
		model.addAttribute("goalList", dao.boardList(tGoalNum));
		return "/board/boardList";
	}

	
}
