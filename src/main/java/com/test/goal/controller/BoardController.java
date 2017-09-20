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
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.goal.dao.BoardDAO;
import com.test.goal.service.BoardService;
import com.test.goal.util.PageNavigator;
import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MainProgressVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	
	// 게시글 목록, 검색, 페이징
	@RequestMapping(value = "boardList", method = RequestMethod.GET)
	public String boardList(Map<String, String> map, Model model,
			@RequestParam(value = "searchKeyid", defaultValue = "1") String searchKeyid, String searchSelect,
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		
		map.put("searchKeyid", searchKeyid); // 검색 select 박스
		map.put("searchSelect", searchSelect); // 검색어
		
		PageNavigator navi = service.getNavi(currentPage, map);
		model.addAttribute("goalList", service.boardList(map, navi));
		model.addAttribute("navi", navi);
		model.addAttribute("searchKeyid", searchKeyid);
		model.addAttribute("searchSelect", searchSelect);
		return "/board/boardList";
	}
	
	// 좋아요 기능
	@RequestMapping(value = "addFavorite", method = RequestMethod.POST)
	@ResponseBody
	public void addFavorite(int boardnum) {
		service.addFavorite(boardnum);
	}
	
	
}
