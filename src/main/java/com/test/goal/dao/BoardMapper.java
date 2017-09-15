package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import com.test.goal.vo.BoardVO;
import com.test.goal.vo.TopGoalVO;

public interface BoardMapper {

	public ArrayList<BoardVO> boardList(); // 게시글 목록

	public ArrayList<BoardVO> searchBoard(Map<String, String> map); // 게시글 검색

}
