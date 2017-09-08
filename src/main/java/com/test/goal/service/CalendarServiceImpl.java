package com.test.goal.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.goal.dao.CalendarDAO;
import com.test.goal.dao.MindMapDAO;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDAO dao;

}
