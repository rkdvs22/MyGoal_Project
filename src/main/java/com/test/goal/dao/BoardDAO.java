package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import com.test.goal.vo.BoardVO;
import com.test.goal.vo.TopGoalVO;

public interface BoardDAO {
	
	public ArrayList<BoardVO> boardList(Map<String, String> map, int startRecord, int countPerPage);	// 게시글 목록, 검색, 페이징
	
	public int getTotal(Map<String, String> map); // 페이징 : 전체 게시글 수 가져오기
	
	public void addFavorite(int boardnum); // 좋아요
	
	public BoardVO getTopGoalNum(); // Board 테이블에서 가장 최신화된 tGoalNum, userid을 가져옴
	
}
