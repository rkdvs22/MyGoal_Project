package com.test.goal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.test.goal.vo.TopGoalVO;

public interface GoalTreeDAO {
	public ArrayList<TopGoalVO> goalList(HashMap<String, String> map);
}