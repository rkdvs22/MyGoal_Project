package com.test.goal.dao;

import java.util.ArrayList;

import com.test.goal.vo.BTMRecordVO;

public interface CalendarDAO {

	ArrayList<BTMRecordVO> getRecordList(String userid);

	ArrayList<BTMRecordVO> getIsProcessingRecord(String memberId);

}
