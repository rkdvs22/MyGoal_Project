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
	public ArrayList<TopGoalVO> boardList() {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.boardList();
	}

	@Override
	public void boardRead() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void replyList() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void writeReply() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReply() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addGoal() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addHit() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void addFavorite() {
		// TODO Auto-generated method stub
		
	}

	// 게시글 검색
	@Override
	public ArrayList<BoardVO> searchBoard(Map<String, String> map) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.searchBoard(map);
	}

}
