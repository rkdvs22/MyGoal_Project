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

	public int getDayPlanNumSequence();

	public void insertDayPlan(DayPlanVO vo);

	public int findDayRecordNum(DayPlanVO vo);

	public void exInsertDayRecord(DayPlanVO vo);

	public void exInsertToDayRecord(DayPlanVO vo);

	public int getDayRecordNum();

	public int getAchieved(DayRecordVO vo);

	public int checkBTMRecord(DayRecordVO vo);

	public int isProgressing(DayRecordVO vo);

	public void updateDayRecord(DayRecordVO vo);

	public int completeUpdateDayRecord(DayRecordVO vo);

	public int getDayAchieve(DayRecordVO vo);

	public int getBTMRecord(DayRecordVO vo);

	public int updateBTMGoalComplete(DayRecordVO vo);

	public int updateMIDGoalComplete(DayRecordVO vo);

	public int getTotalBTMRecordAmount(DayRecordVO vo);

	public int getSuccessBTMRecordAmount(DayRecordVO vo);

	public int getSuccessMIDRecordAmount(DayRecordVO vo);

	public void updateTopGoalComplete(DayRecordVO vo);


}
