package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.ui.Model;

import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.BoardVO;
import com.test.goal.vo.FindHostVO;
import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.MemberListVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MidGoalVO;
import com.test.goal.vo.TopGoalVO;

public interface CreateGoalDAO {
	
	public void create1(MainProgressVO mvo); // 목표大작성 전 MainProgress 테이블에 사용자가 작성한 값을 입력한다.
	public MainProgressVO findProgressNum(); // 현재 progressNum의 데이터를 알기 위한 메서드
	
	public int create2(TopGoalVO tvo); // 목표大작성
	
	public void create3(MemberListVO mlvo); // 멤버리스트 작성
	
	public TopGoalVO findTGoalNum(); // 현재 최종목표의 시퀀스 번호를 얻는다(); // 현재 최종목표의 시퀀스 번호를 얻는다
	public void writeBoard(BoardVO bvo); // 목표大작성 기능에서 작성했던 내용들을 이용하여 Board 테이블에 값을 입력한다.
	
	public TopGoalVO getInvitedProgress(int progressNum); //초대장에 목표 정보 전송 위함
	
	
	
	
	public ArrayList<MemberVO> findIdinModal(String keyWord); // modal 창 안에서 사용자의 ID를 검색한다

	
	

	

	public BoardVO getBoardInfo(); // 현재 게시글의 정보를 얻는다

	public TopGoalVO findThatGoal(String senderId); // 목표 초대에 승인했을 경우 초대한 목표에 대한 정보를 찾는다.
	
	public BoardVO findCurrentBoard(String id); // 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제하기 위해 현 게시글의 정보를 받아온다.

	public MainProgressVO findCurrentTgoal(BoardVO vo); // 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제하기 위해 현재 MainProgress의 정보를 받아온다.

	public void exitCreateGoal(String id); // 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제한다.

	public ArrayList<MemberListVO> joinThatGoal(TopGoalVO vo); // 초대한 목표로 이동한다.

	public MidGoalVO inputMidGoal(MidGoalVO mvo); // 작성한 중간목표를 입력한다.

	public MidGoalVO selectNowMidGoal(MidGoalVO mvo); // 현재 작성한 중간목표를 불러온다.

	public void inputBtmGoal(BTMGoalVO vo); // 작성한 세부목표들을 입력한다.

	public String findThisGoalHost(FindHostVO host_vo); // 해당하는 방의 HOST 아이디를 불러온다.

	public int updateColor(Map<String, String> map); // 사용자가 선택한 색상의 hex값을 테이블에 갱신한다.

	public String getReadyFlag(Map<String, String> map); // 준비를 누른 사람이 이전에 레디를 했는지에 대한 여부를 불러온다.

	public Map<String, Object> treeToGoal(int goalNum); // GoalTree에서 목표를 선택할 시 그에 맞는 마방진으로 이동한다.

	public ArrayList<MemberListVO> checkUsers(int progressNum); // 유저들의 색상지정 여부와 레디 여부를 불러온다.
	

}
