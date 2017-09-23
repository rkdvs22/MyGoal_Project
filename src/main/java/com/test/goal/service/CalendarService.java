package com.test.goal.service;

import java.util.ArrayList;

import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.DayPlanVO;
import com.test.goal.vo.DayRecordVO;

public interface CalendarService {

	ArrayList<BTMRecordVO> getRecordList(String userid);

	ArrayList<BTMRecordVO> getIsProcessingRecord(String memberId);

	ArrayList<DayRecordVO> getChartRecord(int bTMRecordNum,String memberId);

	ArrayList<DayPlanVO> getDayRecordList(String userid);

	ArrayList<DayPlanVO> getNomalPlanlist(String userid);

	void deleteDayPlan(int dayPlanNum);

	void updateDayPlan(DayPlanVO vo);

	int createDayPlan(DayPlanVO vo);

	int getAchieve(DayRecordVO vo);

	void updateAchieve(DayRecordVO vo);

	int getDayAchieve(DayRecordVO vo);

	int getBTMRecord(DayRecordVO vo);

}
