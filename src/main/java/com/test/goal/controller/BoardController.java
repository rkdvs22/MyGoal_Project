package com.test.goal.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.goal.dao.BoardDAO;
import com.test.goal.dao.CreateGoalDAO;
import com.test.goal.dao.GoalTreeDAO;
import com.test.goal.dao.MemberDAO;
import com.test.goal.service.BoardService;
import com.test.goal.util.PageNavigator;
import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.MemberListVO;
import com.test.goal.vo.TopGoalVO;

@Controller
@RequestMapping("/board")
public class BoardController {
	
	private static final Logger logger = LoggerFactory.getLogger(BoardController.class);
	
	@Autowired
	private BoardService service;
	@Autowired
	private GoalTreeDAO tree_dao;
	@Autowired
	private CreateGoalDAO dao;
	
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
	
	// 완료된 마방진페이지로 이동
	@RequestMapping(value = "toMsquare", method = RequestMethod.GET)
	public String toMsquare(int tGoalNum, Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		
		model.addAttribute("topGoal", tree_dao.topGoalList(tGoalNum));
		model.addAttribute("midGoal", tree_dao.midGoalList(tGoalNum));
		
		//인서트 해야됨 topGoal과 memberlist
		TopGoalVO vo = new TopGoalVO();
		vo.settGoalNum(tGoalNum);
		
		int progressNum = service.getProgressNum(vo).getProgressNum(); //해당 topGoal에 대응하는 progressNum 불러오기
		
		vo.setUserid(userid);
		vo.setProgressNum(progressNum);
		
		MemberListVO mvo = service.getMemberList(vo); //목표에 참여한 memberList
		
		if (mvo == null) {	//이미 참여한 목표일 때 insert 하지 않음
			vo = dao.findTopGoal(vo);
			/*
			TopGoalVO tVO = dao.findTopGoal(vo);
			vo.settGoalTitle(tVO.gettGoalTitle());
			vo.settStartDate(tVO.gettStartDate());
			vo.settEndDate(tVO.gettEndDate());
			vo.settClear(tVO.gettClear());
			vo.settStartStatus(tVO.gettStartStatus());
			vo.setOpenStatus(tVO.getOpenStatus());
			System.out.println(vo.toString());
			*/
			dao.insertJoinTopGoal(vo);
			MemberListVO mlvo = new MemberListVO();
			mlvo.setProgressNum(progressNum);
			mlvo.setUserid(userid);
			dao.messageJoin(mlvo); //멤버리스트 생성
		}
		
		ArrayList<MemberListVO> memberList = tree_dao.memberList(tGoalNum+1);
		for (MemberListVO m : memberList) {
			if (m.getColor() == null) {
				m.setColor("black"); //색상 미지정시 검정색으로 전달
			}
		}
		
		model.addAttribute("memberList", memberList); //참여 멤버 정보 전달
		model.addAttribute("currentMembers", memberList.size()); //현재 인원수
		model.addAttribute("mainProgress", service.getProgressNum(vo)); //mainProgress
		return "/createGoal/MGoalSquareForm2";
		
	}
	
	
}
