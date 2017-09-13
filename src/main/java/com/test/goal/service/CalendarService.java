package com.test.goal.service;

import java.util.ArrayList;

import com.test.goal.vo.BTMRecordVO;

public interface CalendarService {

	ArrayList<BTMRecordVO> getRecordList(String userid);

	ArrayList<BTMRecordVO> getIsProcessingRecord(String memberId);

}
