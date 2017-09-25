package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import javax.swing.Spring;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MidGoalVO;
import com.test.goal.vo.MyFriendVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlsession;
	
	// 회원가입
	@Override
	public int join(MemberVO vo) {
		System.out.println(vo.toString());
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.join(vo);
	}

	// 로그인
	@Override
	public MemberVO login(MemberVO vo) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.login(vo);
	}

	// 로그아웃
	@Override
	public void logout() {
		
	}

	// ID, pwd 찾기
	@Override
	public MemberVO find(String email) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.find(email);		
	}

	// 회원목록
	@Override
	public MemberVO memberList(String userid) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.memberList(userid);
	}

	// 회원정보수정
	@Override
	public int updateMember(MemberVO vo) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.updateMember(vo);
	}

	// ID, PWD 일치여부
	@Override
	public MemberVO idMatchUp(MemberVO vo) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.idMatchUp(vo);
	}

	@Override
	public int getTotalNum(String userid) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.getTotalNum(userid);
	}

	@Override
	public int getClearNum(String userid) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.getClearNum(userid);
	}

	@Override
	public int getFailNum(String userid) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.getFailNum(userid);
	}

	@Override
	public ArrayList<MidGoalVO> getTopGoalList(String userid) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.getTopGoalList(userid);
	}

	@Override
	public ArrayList<MidGoalVO> getMGoalList(int tGoalNum) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.getMGoalList(tGoalNum);
	}

	@Override
	public ArrayList<BTMGoalVO> getBTMGoalList(int mGoalNum) {
		MemberMapper mapper = sqlsession.getMapper(MemberMapper.class);
		return mapper.getBTMGoalList(mGoalNum);
	}
	
}
