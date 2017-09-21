package com.test.goal.dao;

import java.util.ArrayList;

import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.DayPlanVO;
import com.test.goal.vo.DayRecordVO;

public interface CalendarMapper {

	public ArrayList<BTMRecordVO> getRecordList(String userid);

	public ArrayList<BTMRecordVO> getIsProcessingRecord(String memberId);

	public ArrayList<DayRecordVO> getChartRecord(int bTMRecordNum);

	public ArrayList<DayPlanVO> getDayRecordList(String userid);

	public ArrayList<DayPlanVO> getNomalPlanlist(String userid);

	public int getAchieve(int btmRecordNum);

	public void deleteDayPlan(int dayPlanNum);

	public void updateDayPlan(DayPlanVO vo);


}
