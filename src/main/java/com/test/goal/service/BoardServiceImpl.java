package com.test.goal.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.goal.dao.BoardDAO;
import com.test.goal.util.PageNavigator;
import com.test.goal.vo.BoardVO;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	private BoardDAO dao;
	
	private final int countPerPage = 12; // 하나의 페이지에 12개의 게시글 표시
	private final int pagePerGroup = 5; // 페이지 5개를 한 그룹으로 표현
	
	// 게시글 목록, 검색, 페이징
	@Override
	public ArrayList<BoardVO> boardList(Map<String, String> map, PageNavigator navi) {
		ArrayList<BoardVO> vo = dao.boardList(map, navi.getStartRecord(), navi.getCountPerPage());
		return dao.boardList(map, navi.getStartRecord(), navi.getCountPerPage());
	}
	
	// 페이징 : 전체 게시글 수 가져오기
	@Override
	public PageNavigator getNavi(int currentPage, Map<String, String> map) {
		int totalRecordsCount = dao.getTotal(map);
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, currentPage, totalRecordsCount);
		return navi;
	}

	// 좋아요
	@Override
	public void addFavorite(int boardnum) {
		dao.addFavorite(boardnum);
	}

	// tGoalNum 이용 TopGoal 테이블에서 host의 progressNum 정보찾기
	@Override
	public String selectTopGoal(int tGoalNum) {
		return dao.selectTopGoal(tGoalNum);
	}
	
	
}
