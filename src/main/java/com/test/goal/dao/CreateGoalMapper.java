package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.BoardVO;
import com.test.goal.vo.FindHostVO;
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

	public String findThisGoalHost(FindHostVO host_vo); // 해당하는 방의 HOST 아이디를 불러온다.

	public int findMyTgoalNum(String myId); // 내가 참여할 방의 최종목표 시퀀스 번호를 반환한다.
	
	public int findNewTgoalNum(); // TOPGOAL 테이블에 들어오는 사람의 ID를 입력하기 전에 시퀀스값을 받아온다.

	public int updateColor(Map<String, String> map); // 사용자가 선택한 색상의 hex값을 테이블에 갱신한다.

	public int getProgressNum(int tGoalNum); // 현재 최종목표에 해당하는 ProgressNum을 반환한다.

	public String getReadyFlag(Map<String, String> map); // 준비를 누른 사람이 이전에 레디를 했는지에 대한 여부를 불러온다.

	public BoardVO getBoardFromTree(Map<String, Object> map); // GoalTree에서 선택한 목표 게시글에 대한 정보를 받아온다

	public MainProgressVO getMainProgress(int progressNum); // GoalTree에서 선택한 목표에 대한 MainProgress 테이블의 특정 데이터를 반환한다.

	public ArrayList<TopGoalVO> getTopGoalFromTree(int progressNum); // GoalTree에서 선택한 목표에 따라 TopGoal 테이블의 데이터들을 반환한다.

	public ArrayList<MemberListVO> getMemberList(int progressNum); // GoalTree에서 선택한 목표에 따라 MemberList 테이블의 데이터들을 반환한다.

}
