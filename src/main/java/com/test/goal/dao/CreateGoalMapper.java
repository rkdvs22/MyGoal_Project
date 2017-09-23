package com.test.goal.dao;

import java.util.ArrayList;

import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.MemberListVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MidGoalVO;
import com.test.goal.vo.TopGoalVO;

public interface CreateGoalMapper {

	public int create1(TopGoalVO tvo); // 목표大작성

	public int create2(MainProgressVO mvo); // 목표大작성 전 MainProgress 테이블에 사용자가 작성한 값을 입력한다.

	public MainProgressVO findProgressNum(); // 현재 progressNum의 데이터를 알기 위한 메서드
	
	public void writeBoard(BoardVO vo); // 목표大작성 기능에서 작성했던 내용들을 이용하여 Board 테이블에 값을 입력한다.
	
	public TopGoalVO getTgoalNum(); // 현재 TopGoalNum칼럼값을 알기 위한 메서드
	
	
	
	
	
	
	
	
	
	
	public ArrayList<MemberVO> findIdinModal(String keyWord); // modal 창 안에서 사용자의 ID를 검색한다



	public BoardVO getBoardInfo(); // 현재 게시글의 정보를 불러온다.

	public TopGoalVO findThatGoal(String senderId); // 목표 초대에 승인했을 경우 초대한 목표에 대한 정보를 찾는다.

	public BoardVO findCurrentBoard(String id); // 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제하기 위해 현 게시글의 정보를 받아온다.

	public MainProgressVO findCurrentTgoal(BoardVO vo); // 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제하기 위해 현재 MainProgress의 정보를 받아온다.

	public int deleteCurrentBoard(String id); // 생성중이던 목표 게시글 삭제

	public int deleteCurrentTgoal(BoardVO vo); // 생성중이던 최종목표 삭제

	public int deleteCurrentMainProgress(MainProgressVO mVO); // 생성중이던 MainProgress의 데이터 삭제

	public void createMemberList(BoardVO vo); // 목표 생성시 MemberList 테이블에 데이터 추가

	public void deleteCurrentMemberList(String id); // 생성중이던 MemberList의 HOST 정보 삭제

	public int inputUserTgoal(TopGoalVO vo); // 초대받은 목표 (TOPGOAL 테이블) 에 초대받은 사람의 ID를 입력한다.

	public int inputUserMemberList(TopGoalVO vo); // 초대받은 목표 (MEMBERLIST 테이블) 에 초대받은 사람의 ID를 입력한다.

	public MemberListVO findUserNowInput(TopGoalVO vo); // 초대에 수락한 사용자에 대한 정보를 받아온다.

	public int inputMidGoal(MidGoalVO mvo); // 작성한 중간목표를 입력한다.

	public MidGoalVO selectNowMidGoal(MidGoalVO mvo); // 현재 작성한 중간목표를 불러온다.

	public int inputBtmGoal(BTMGoalVO vo); // 작성한 세부목표들을 입력한다.
	
	
}
