package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MemberListVO;
import com.test.goal.vo.TopGoalVO;

@Repository
public class BoardDAOImpl implements BoardDAO {

	@Autowired
	private SqlSession sqlsession;
	
	// 게시글 목록, 검색, 페이징
	@Override
	public ArrayList<BoardVO> boardList(Map<String, String> map, int startRecord, int countPerPage) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		return mapper.boardList(map, rb);
	}

	// 페이징 : 전체 게시글 수 가져오기
	@Override
	public int getTotal(Map<String, String> map) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.getTotal(map);
	}
	
	// 좋아요
	@Override
	public void addFavorite(int boardnum) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		mapper.addFavorite(boardnum);
	}
	
	// Board 테이블에서 가장 최신화된 tGoalNum, userid을 가져옴
	@Override
	public BoardVO getTopGoalNum() {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.getTopGoalNum();
	}

	// TopGoal 테이블에서 tGoalNum을 이용 progressNum 가져옴
	@Override
	public TopGoalVO getGoalProgressNum() {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.getGoalProgressNum();
	}

	//TopGoal 테이블의 progressNum을 이용하여 MemberList 테이블의 progressNum 가져옴
	@Override
	public MemberListVO getMemberProgressNum() {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.getMemberProgressNum();
	}

	// MemberList 테이블에 user에 대한 데이터 입력
	@Override
	public MemberListVO inputMemberList(MemberListVO lvo) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.inputMemberList(lvo);
	}

	// TopGoal 테이블에 user에 대한 데이터 입력
	@Override
	public TopGoalVO inputTopGoal(TopGoalVO tvo) {
		BoardMapper mapper = sqlsession.getMapper(BoardMapper.class);
		return mapper.inputTopGoal(tvo);
	}


	
}
