package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.test.goal.vo.BoardVO;

public interface BoardMapper {

	public ArrayList<BoardVO> boardList(Map<String, String> map, RowBounds rb); // 게시글 목록, 검색, 페이징

	public int getTotal(Map<String, String> map); // 페이징 : 전체 게시글 수 가져오기

	public void addFavorite(int boardnum); // 좋아요

	public String selectTopGoal(int tGoalNum); // tGoalNum 이용 TopGoal 테이블에서 host의 progressNum 정보찾기

}
