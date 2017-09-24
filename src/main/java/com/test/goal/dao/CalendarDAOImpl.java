package com.test.goal.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.BTMSectionVO;
import com.test.goal.vo.DayPlanVO;
import com.test.goal.vo.DayRecordVO;

@Repository
public class CalendarDAOImpl implements CalendarDAO{
	
	@Autowired
	private SqlSession sqlsession;

	@Override
	public ArrayList<BTMRecordVO> getRecordList(String userid) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
		return mapper.getRecordList(userid);
	}

	@Override
	public ArrayList<BTMRecordVO> getIsProcessingRecord(String memberId) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
		return mapper.getIsProcessingRecord(memberId);
	}

	@Override
	public ArrayList<DayRecordVO> getChartRecord(int bTMRecordNum) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
		return mapper.getChartRecord(bTMRecordNum);
	}

	@Override
	public ArrayList<DayPlanVO> getDayRecordList(String userid) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
		ArrayList<DayPlanVO> planList = mapper.getDayRecordList(userid);
		if(planList != null){
			for (int i = 0; i <planList.size(); i++) {
				int achieve = 0;
				achieve = mapper.getAchieve(planList.get(i).getBtmRecordNum());
				planList.get(i).setAchieve(achieve);
			}
		}
		
		return planList;
	}

	@Override
	public ArrayList<DayPlanVO> getNomalPlanlist(String userid) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
		return mapper.getNomalPlanlist(userid);
	}

	@Override
	public void deleteDayPlan(int dayPlanNum) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    mapper.deleteDayPlan(dayPlanNum);
	}

	@Override
	public void updateDayPlan(DayPlanVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    mapper.updateDayPlan(vo);
	}

	@Override
	public int createDayPlan(DayPlanVO vo) {
		//여기서 4가지 경우를 검사해서 경우별로 다르게 쿼리를 날림 단 먼저 DayPlanNum 시퀀스는 dual을 통해 받아와야 함.
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
		int btmRecordNum = vo.getBtmRecordNum();
		int dayRecordNum = vo.getDayRecordNum();
		int dayPlanNum = mapper.getDayPlanNumSequence();
		int findDayRecordNum = 0;	
		vo.setDayPlanNum(dayPlanNum);
		
		if(btmRecordNum != 0 && dayRecordNum != 0){
			mapper.insertDayPlan(vo);
		}else if(btmRecordNum != 0 && dayRecordNum == 0){
			// select문을 통해 BTMRecordNum을 매개로 DayPlan의 startDate 날짜를 조건으로 하여 해당 DayRecordNum을 찾아와야 한다.
			dayRecordNum = mapper.findDayRecordNum(vo);
			vo.setDayRecordNum(dayRecordNum);
			mapper.insertDayPlan(vo);
		}else if(btmRecordNum == 0 && dayRecordNum != 0){
			mapper.insertDayPlan(vo);
		}else if(btmRecordNum == 0 && dayRecordNum == 0 ){
			// dayRecord를 먼저 한개 insert 해야만 한다.
			findDayRecordNum = mapper.getDayRecordNum();
			vo.setDayRecordNum(findDayRecordNum);
			if(vo.getGetToday().equals(vo.getStartDate())){
				mapper.exInsertToDayRecord(vo);
			}else{
				mapper.exInsertDayRecord(vo);
			}
			mapper.insertDayPlan(vo);
		}
		
		return dayPlanNum;
	}

	@Override
	public int getAchieve(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    return mapper.getAchieved(vo);
	}

	@Override
	public int checkBTMRecord(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    return mapper.checkBTMRecord(vo);
	}

	@Override
	public int isProgressing(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    return mapper.isProgressing(vo);
	}

	@Override
	public void updateDayRecord(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    mapper.updateDayRecord(vo);
	}

	@Override
	public int completeUpdateDayRecord(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	   return mapper.completeUpdateDayRecord(vo);
	}

	@Override
	public int getDayAchieve(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    return mapper.getDayAchieve(vo);
	}

	@Override
	public int getBTMRecord(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    return mapper.getBTMRecord(vo);
	}

	@Override
	public int updateBTMGoalComplete(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    return mapper.updateBTMGoalComplete(vo);
	}

	@Override
	public int updateMIDGoalComplete(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    return mapper.updateMIDGoalComplete(vo);
	}

	@Override
	public int getTotalBTMRecordAmount(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    return mapper.getTotalBTMRecordAmount(vo);
	}

	@Override
	public int getSuccessBTMRecordAmount(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    return mapper.getSuccessBTMRecordAmount(vo);
	}

	@Override
	public int getSuccessMIDRecordAmount(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    return mapper.getSuccessMIDRecordAmount(vo);
	}

	@Override
	public void updateTopGoalComplete(DayRecordVO vo) {
		CalendarMapper mapper = sqlsession.getMapper(CalendarMapper.class);
	    mapper.updateTopGoalComplete(vo);
	}

}
