package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.web.multipart.MultipartFile;

import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MidGoalVO;
import com.test.goal.vo.MyFriendVO;

public interface MemberDAO {
	public int join(MemberVO vo);	// 회원가입
	
	public MemberVO login(MemberVO vo);	// 로그인
	
	public void logout();	// 로그아웃
	
	public MemberVO find(String email); //ID, pwd 찾기
	
	public int updateMember(MemberVO vo); // 회원정보수정
	
	public MemberVO memberList(String userid); // 회원목록

	public MemberVO idMatchUp(MemberVO vo); // ID, PWD 일치여부

	public int getTotalNum(String userid);

	public int getClearNum(String userid);

	public int getFailNum(String userid);

	public ArrayList<MidGoalVO> getTopGoalList(String userid);

	public ArrayList<MidGoalVO> getMGoalList(int tGoalNum);

	public ArrayList<BTMGoalVO> getBTMGoalList(int mGoalNum);


	
}