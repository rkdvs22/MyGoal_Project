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
	
	
	
	
	
	
	
	
	
	
	public ArrayList<MemberVO> findIdinModal(String keyWord);


	public MainProgressVO inputMainProgress(MainProgressVO mvo);


}
