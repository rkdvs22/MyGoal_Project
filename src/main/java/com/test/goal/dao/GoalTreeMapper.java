package com.test.goal.dao;

import java.util.ArrayList;
import java.util.HashMap;
import com.test.goal.vo.TopGoalVO;

public interface GoalTreeMapper {
	public ArrayList<TopGoalVO> goalList(HashMap<String, String> map);
}
