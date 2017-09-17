package com.test.goal.dao;

import java.util.ArrayList;

import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.TopGoalVO;

public interface CreateGoalMapper {

	public String create1(TopGoalVO tvo); // 목표大작성

	public String create2(MainProgressVO mvo); // 목표大작성(인원수 : MaxMember)

	
	
	
	
	
	
	
	
	
	
	
	
	
	public ArrayList<MemberVO> findIdinModal(String keyWord);

}
