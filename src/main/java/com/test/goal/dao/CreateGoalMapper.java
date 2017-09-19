package com.test.goal.dao;

import java.util.ArrayList;

import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.TopGoalVO;

public interface CreateGoalMapper {

	public int create1(TopGoalVO tvo); // 목표大작성

	public int create2(MainProgressVO mvo); // 목표大작성 전 MainProgress 테이블에 사용자가 작성한 값을 입력한다.

	public MainProgressVO findProgressNum(); // 현재 progressNum의 데이터를 알기 위한 메서드
	
	public void writeBoard(BoardVO vo); // 목표大작성 기능에서 작성했던 내용들을 이용하여 Board 테이블에 값을 입력한다.
	
	public TopGoalVO getTgoalNum(); // 현재 TopGoalNum칼럼값을 알기 위한 메서드
	
	
	
	
	
	
	
	
	
	
	public ArrayList<MemberVO> findIdinModal(String keyWord); // modal 창 안에서 사용자의 ID를 검색한다



	public BoardVO getBoardInfo(); // 현재 게시글의 정보를 불러온다.

	public BoardVO findThatGoal(String senderId); // 초대 메시지에 승인할 시 해당하는 목표가 무엇인지 찾는다.


}
