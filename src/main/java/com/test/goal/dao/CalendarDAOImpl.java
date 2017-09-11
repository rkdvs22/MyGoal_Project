package com.test.goal.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.BTMSectionVO;

@Repository
public class CalendarDAOImpl implements CalendarDAO{
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public ArrayList<BTMRecordVO> getRecordList(String userid) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
		return mapper.getCalendar(userid);
	}

}
