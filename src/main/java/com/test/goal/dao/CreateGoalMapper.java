package com.test.goal.dao;

import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.TopGoalVO;

public interface CreateGoalMapper {

	public String create1(TopGoalVO tvo); // 목표大작성

	public String create2(MainProgressVO mvo); // 목표大작성(인원수 : MaxMember)
}
