package com.test.goal.dao;

import java.util.ArrayList;
import java.util.HashMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.GoalTreeVO;

@Repository
public class GoalTreeDAOImpl implements GoalTreeDAO {

	@Autowired
	private SqlSession sqlsession;

	@Override
	public ArrayList<GoalTreeVO> goalList(String userid) {
		GoalTreeMapper mapper = sqlsession.getMapper(GoalTreeMapper.class);
		return mapper.goalList(userid);
	}
}
