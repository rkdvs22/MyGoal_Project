package com.test.goal.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.ui.Model;

import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.TopGoalVO;

@Repository
public class CreateGoalDAOImpl implements CreateGoalDAO {

	@Autowired
	private SqlSession sqlsession;
	
	// 목표大작성
	@Override
	public int create1(TopGoalVO tvo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.create1(tvo);
	}
	
	// TopGoal 테이블의 현재 TopGoalNum 값을 받아온다.
	@Override
	public TopGoalVO getTgoalNum() {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.getTgoalNum();
	}

	// 목표大작성 전 MainProgress 테이블에 사용자가 작성한 값을 입력한다.
	@Override
	public MainProgressVO create2(MainProgressVO mvo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		int result = mapper.create2(mvo);
		if(result == 1) {
			mvo = findProgressNum();
		}
		return mvo;
	}

	// 현재 progressNum의 데이터를 알기 위한 메서드
	@Override
	public MainProgressVO findProgressNum() {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		MainProgressVO mvo = mapper.findProgressNum();
		return mvo;
	}
	
	// 목표大작성 기능에서 작성했던 내용들을 이용하여 Board 테이블에 값을 입력한다.
	@Override
	public void writeBoard(BoardVO vo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		// 목표 생성시 MemberList 테이블에 데이터 추가
		MainProgressVO mvo = mapper.findProgressNum();
		vo.setProgressNum(mvo.getProgressNum());
		mapper.createMemberList(vo);
		mapper.writeBoard(vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	// 현재 게시글의 정보를 불러온다.
	@Override
	public BoardVO getBoardInfo() {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.getBoardInfo();
	}
	
	// modal 창 안에서 사용자의 ID를 검색한다
	@Override
	public ArrayList<MemberVO> findIdinModal(String keyWord) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.findIdinModal(keyWord);
	}

	// 초대 메시지에 승인할 시 해당하는 목표가 무엇인지 찾는다.
	@Override
	public BoardVO findThatGoal(String senderId) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.findThatGoal(senderId);
	}

	// 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제하기 위해 현 게시글의 정보를 받아온다.
	@Override
	public BoardVO findCurrentBoard(String id) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.findCurrentBoard(id);
	}
	
	// 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제하기 위해 현재 MainProgress의 정보를 받아온다.
	@Override
	public MainProgressVO findCurrentTgoal(BoardVO vo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.findCurrentTgoal(vo);
	}
	
	// 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제한다.
	@Override
	public void exitCreateGoal(String id) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		System.out.println(id);
		BoardVO vo = findCurrentBoard(id);
		System.out.println(vo);
		MainProgressVO mVO = findCurrentTgoal(vo);
		System.out.println(mVO);
		mapper.deleteCurrentBoard(id);
		mapper.deleteCurrentTgoal(vo);
		mapper.deleteCurrentMainProgress(mVO);
	}
}
