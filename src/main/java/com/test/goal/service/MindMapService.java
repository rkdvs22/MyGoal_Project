package com.test.goal.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.BTMSectionVO;
import com.test.goal.vo.MemberRecord;
import com.test.goal.vo.MidGoalVO;

public interface MindMapService {
    
	//클릭한 중간목표의 섹션값을 가져오는 메서드
	ArrayList<BTMSectionVO> findBTMSection(int SectionNum);
    
	// 해당 중간 목표(클릭된)의 BTMGoal 리스트를 반환하는 메서드
	ArrayList<BTMGoalVO> findBTMGoal(int mGoalNum);

	MidGoalVO findMidGoal(int mGoalNum);

	HashMap<String, ArrayList> randomAllocate(HashMap<String, Integer> memberGoalNum,
	                                          int progressNum, String isClick,HttpServletRequest request, String clickedNodeTitle, int clickedNodeNum,int BTMSectionNum);

	ArrayList<MemberRecord> getRecordList(HashMap<String, Integer> memberGoalNum);

	ArrayList<BTMGoalVO> getBtmGoalList(MidGoalVO midGoalVO);
	
}
