package com.test.goal.dao;

import java.util.ArrayList;

import org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding;

import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MidGoalVO;


public interface MemberMapper {

	public int join(MemberVO vo); // 회원가입
	
	public MemberVO login(MemberVO vo); // 로그인

	public int updateMember(MemberVO vo); // 회원정보수정

	public MemberVO find(String email); // ID,Pwd 찾기

	public MemberVO memberList(String userid); // 회원목록

	public MemberVO idMatchUp(MemberVO vo); // ID, PWD 일치여부

	public int getTotalNum(String userid);

	public int getClearNum(String userid);

	public int getFailNum(String userid);

	public ArrayList<MidGoalVO> getTopGoalList(String userid);

	public ArrayList<MidGoalVO> getMGoalList(int tGoalNum);

	public ArrayList<BTMGoalVO> getBTMGoalList(int mGoalNum);



	




	

}
