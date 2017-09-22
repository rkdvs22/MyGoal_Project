package com.test.goal.dao;

import java.util.ArrayList;

import org.springframework.ui.Model;

import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.MemberListVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.TopGoalVO;

public interface CreateGoalDAO {
	
	public int create1(TopGoalVO tvo); // 목표大작성

	public MainProgressVO create2(MainProgressVO mvo); // 목표大작성 전 MainProgress 테이블에 사용자가 작성한 값을 입력한다.
	
	public ArrayList<MemberVO> findIdinModal(String keyWord); // modal 창 안에서 사용자의 ID를 검색한다

	public void writeBoard(BoardVO vo); // 목표大작성 기능에서 작성했던 내용들을 이용하여 Board 테이블에 값을 입력한다.
	
	public MainProgressVO findProgressNum(); // 현재 progressNum의 데이터를 알기 위한 메서드

	public TopGoalVO getTgoalNum(); // 현재 최종목표의 시퀀스 번호를 얻는다

	public BoardVO getBoardInfo(); // 현재 게시글의 정보를 얻는다

	public TopGoalVO findThatGoal(String senderId); // 목표 초대에 승인했을 경우 초대한 목표에 대한 정보를 찾는다.
	
	public BoardVO findCurrentBoard(String id); // 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제하기 위해 현 게시글의 정보를 받아온다.

	public MainProgressVO findCurrentTgoal(BoardVO vo); // 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제하기 위해 현재 MainProgress의 정보를 받아온다.

	public void exitCreateGoal(String id); // 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제한다.

	public MemberListVO joinThatGoal(TopGoalVO vo); // 초대한 목표로 이동한다.
	
	
	
	



}
