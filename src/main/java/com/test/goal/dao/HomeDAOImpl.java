package com.test.goal.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.BoardVO;

@Repository
public class HomeDAOImpl implements HomeDAO {

	private SqlSession sqlsession;
	
	// 게시판 불러오기
	@Override
	public ArrayList<BoardVO> homeBoard() {
		HomeMapper mapper = sqlsession.getMapper(HomeMapper.class);
		return mapper.homeBoard();
	}

}
