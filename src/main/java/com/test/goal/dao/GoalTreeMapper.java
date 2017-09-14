package com.test.goal.dao;

import java.util.ArrayList;

import com.test.goal.vo.GoalTreeVO;

public interface GoalTreeMapper {
	public ArrayList<GoalTreeVO> goalList(String userid, String tStartYear);
}
