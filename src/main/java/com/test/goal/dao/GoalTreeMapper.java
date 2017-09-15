package com.test.goal.dao;

import java.util.ArrayList;
import com.test.goal.vo.TopGoalVO;

public interface GoalTreeMapper {
	public ArrayList<TopGoalVO> goalList(String userid);
}
