package com.test.goal.dao;

import java.util.ArrayList;

import com.test.goal.vo.BTMRecordVO;

public interface CalendarMapper {

	public ArrayList<BTMRecordVO> getCalendar(String userid);

}
