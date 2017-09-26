package com.test.goal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.test.goal.vo.MemberListVO;
import com.test.goal.vo.MidGoalVO;
import com.test.goal.vo.TopGoalVO;

public interface GoalTreeMapper {
	public ArrayList<TopGoalVO> goalList(HashMap<String, String> map);
	public TopGoalVO topGoalList(int tGoalNum);
	public ArrayList<MidGoalVO> midGoalList(int tGoalNum);
	public ArrayList<MemberListVO> memberList(int tGoalNum);
}
