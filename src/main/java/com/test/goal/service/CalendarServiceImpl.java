package com.test.goal.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.goal.dao.CalendarDAO;
import com.test.goal.dao.MindMapDAO;
import com.test.goal.vo.BTMRecordVO;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDAO dao;

	@Override
	public ArrayList<BTMRecordVO> getRecordList(String userid) {
		return dao.getRecordList(userid);
	}

}
