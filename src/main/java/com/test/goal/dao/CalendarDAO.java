package com.test.goal.dao;

import java.util.ArrayList;

import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.DayPlanVO;
import com.test.goal.vo.DayRecordVO;

public interface CalendarDAO {

	ArrayList<BTMRecordVO> getRecordList(String userid);

	ArrayList<BTMRecordVO> getIsProcessingRecord(String memberId);

	ArrayList<DayRecordVO> getChartRecord(int bTMRecordNum);

	ArrayList<DayPlanVO> getDayRecordList(String userid);

	ArrayList<DayPlanVO> getNomalPlanlist(String userid);

	void deleteDayPlan(int dayPlanNum);

	void updateDayPlan(DayPlanVO vo);

	int createDayPlan(DayPlanVO vo);

	int getAchieve(DayRecordVO vo);

	int checkBTMRecord(DayRecordVO vo);

	int isProgressing(DayRecordVO vo);

	void updateDayRecord(DayRecordVO vo);

	void completeUpdateDayRecord(DayRecordVO vo);

	int getDayAchieve(DayRecordVO vo);

}
