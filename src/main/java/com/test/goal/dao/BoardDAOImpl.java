package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.BoardVO;
import com.test.goal.vo.TopGoalVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlsession;
	
	// 게시글 목록
	@Override
	public ArrayList<BoardVO> boardList() {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.boardList();
	}

	// 게시글 검색
	@Override
	public ArrayList<BoardVO> searchBoard(Map<String, String> map) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.searchBoard(map);
	}

	
	@Override
	public void boardRead() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addGoal() {
		// TODO Auto-generated method stub
		
	}

	// 좋아요
	@Override
	public void addFavorite(int boardnum) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		mapper.addFavorite(boardnum);
	}

	// 페이징
	@Override
	public int getTotal(Map<String, String> map) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.getTotal(map);
	}

	
}
