package com.test.goal.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MessageVO;

@Repository
public class HomeDAOImpl implements HomeDAO {

	@Autowired
	private SqlSession sqlsession;
	
	// 게시판 불러오기
	@Override
	public ArrayList<BoardVO> homeBoard() {
		HomeMapper mapper = sqlsession.getMapper(HomeMapper.class);
		return mapper.homeBoard();
	}

	@Override
	public ArrayList<MessageVO> homeMessage(String userid) {
		HomeMapper mapper = sqlsession.getMapper(HomeMapper.class);
		return mapper.homeMessage(userid);
	}

}
