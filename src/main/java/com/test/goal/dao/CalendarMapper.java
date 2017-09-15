package com.test.goal.dao;

import java.util.ArrayList;

import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.DayRecordVO;

public interface CalendarMapper {

	public ArrayList<BTMRecordVO> getRecordList(String userid);

	public ArrayList<BTMRecordVO> getIsProcessingRecord(String memberId);

	public ArrayList<DayRecordVO> getChartRecord(int bTMRecordNum);


}
