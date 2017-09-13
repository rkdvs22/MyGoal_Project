package com.test.goal.dao;

import java.util.ArrayList;

import com.test.goal.vo.BoardVO;
import com.test.goal.vo.TopGoalVO;

public interface BoardMapper {

	public ArrayList<TopGoalVO> boardList(int tGoalNum); // 게시글 목록

}
