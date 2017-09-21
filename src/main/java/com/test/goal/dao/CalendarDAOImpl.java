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

}
