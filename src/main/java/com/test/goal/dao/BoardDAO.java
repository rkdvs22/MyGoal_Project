package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import com.test.goal.vo.BoardVO;
import com.test.goal.vo.TopGoalVO;

public interface BoardDAO {
	public ArrayList<BoardVO> boardList();	// 게시글 목록
	public ArrayList<BoardVO> searchBoard(Map<String, String> map); // 게시글 검색
	public void boardRead();	//�Խñ� �б�
	public void addGoal();	//��ǥ ���
	public void addFavorite(int boardnum); // 좋아요
	public int getTotal(Map<String, String> map); // 페이징
}
