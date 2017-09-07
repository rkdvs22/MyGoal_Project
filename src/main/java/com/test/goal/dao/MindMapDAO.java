package com.test.goal.dao;

import java.util.ArrayList;

import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.BTMSectionVO;
import com.test.goal.vo.CalendarVO;
import com.test.goal.vo.DayRecordVO;
import com.test.goal.vo.FindMemberColor;
import com.test.goal.vo.InsertDayRecord;
import com.test.goal.vo.MidGoalVO;

public interface MindMapDAO {

	ArrayList<BTMSectionVO> findBTMSection(int sectionNum);

	ArrayList<BTMGoalVO> findBTMGoal(int mGoalNum);

	MidGoalVO findMidGoal(int mGoalNum);

	String findSysdate();

	BTMRecordVO findBtmRecord(int bGoalNum);

	String sendMemberColor(FindMemberColor key);

	ArrayList<DayRecordVO> getDayRecordList(int btmRecordNum);

	int insertBTMRecord(BTMRecordVO vo);

	CalendarVO findCalendar(String memberId);

	BTMGoalVO findBtmGoal(BTMGoalVO vo);

	void insertDayRecord(InsertDayRecord recordKey);

	ArrayList<DayRecordVO> findDayRecordList(int bRecordNum);

	int isProgressing(int btmRecordNum);

	String getStartDate(int dayRecordNum);

	int isStatusY();

	String getSysdate();

	int isSuccess(int bRecordNum);

	ArrayList<DayRecordVO> getSuccessDayRecordList(BTMRecordVO bRecord);

	BTMRecordVO findBtmRecordNotFormatting(int bGoalNum);
}
