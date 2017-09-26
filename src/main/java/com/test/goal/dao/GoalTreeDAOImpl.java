package com.test.goal.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.MemberListVO;
import com.test.goal.vo.MidGoalVO;
import com.test.goal.vo.TopGoalVO;

@Repository
public class GoalTreeDAOImpl implements GoalTreeDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public ArrayList<TopGoalVO> goalList(HashMap<String, String> map) {
		GoalTreeMapper mapper = sqlsession.getMapper(GoalTreeMapper.class);
		return mapper.goalList(map);
	}
	
	@Override
	public TopGoalVO topGoalList(int tGoalNum) {
		GoalTreeMapper mapper = sqlsession.getMapper(GoalTreeMapper.class);
		return mapper.topGoalList(tGoalNum);
	}

	@Override
	public ArrayList<MidGoalVO> midGoalList(int tGoalNum) {
		GoalTreeMapper mapper = sqlsession.getMapper(GoalTreeMapper.class);
		return mapper.midGoalList(tGoalNum);
	}

	@Override
	public ArrayList<MemberListVO> memberList(int tGoalNum) {
		GoalTreeMapper mapper = sqlsession.getMapper(GoalTreeMapper.class);
		return mapper.memberList(tGoalNum);
	}
}
