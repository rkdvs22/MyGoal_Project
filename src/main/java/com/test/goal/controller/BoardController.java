package com.test.goal.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.test.goal.dao.BoardDAO;
import com.test.goal.vo.MainProgressVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardDAO dao;
	
	// 게시글 목록
	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList(Model model) {
		model.addAttribute("goalList", dao.boardList());
		return "/board/boardList";
	}

	// 게시글 검색
	@RequestMapping(value = "searchBoard", method = RequestMethod.GET)
	public String searchBoard(Map<String, String> map, Model model,
			@RequestParam(value = "searchKey", defaultValue = "1") String searchKey, String searchSelect) {
		map.put("searchKey", searchKey);
		map.put("searchSelect", searchSelect);
		
		model.addAttribute("search", dao.searchBoard(map));
		
		return "/board/boardList";
	}
	
}
