package com.test.goal.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.TopGoalVO;

@Repository
public class CreateGoalDAOImpl implements CreateGoalDAO {

	@Autowired
	private SqlSession sqlsession;
	
	// 목표大작성
	@Override
	public String create(TopGoalVO tvo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.create(tvo);
	}

}
