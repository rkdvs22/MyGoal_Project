package com.test.goal.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import org.apache.ibatis.javassist.expr.NewArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.goal.dao.CalendarDAO;
import com.test.goal.dao.MindMapDAO;
import com.test.goal.vo.BTMRecordVO;
import com.test.goal.vo.DayPlanVO;
import com.test.goal.vo.DayRecordVO;

@Service
public class CalendarServiceImpl implements CalendarService{

	@Autowired
	private CalendarDAO dao;

	@Override
	public ArrayList<BTMRecordVO> getRecordList(String userid) {
		ArrayList<BTMRecordVO> BTMRecordList = dao.getRecordList(userid);
		
		Date date = Calendar.getInstance().getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
		long toDay = Long.parseLong(formatter.format(date));
		
		for(int i = 0; i < BTMRecordList.size(); i++){
			String color = "";
			long startDate = 0;
			long endDate = 0;
			
			String[] parsing1 = BTMRecordList.get(i).getStartDate().split(" ");
			String[] parsing2 = parsing1[0].split("-");
			String[] parsing3 = BTMRecordList.get(i).getEndDate().split(" ");
			String[] parsing4 = parsing3[0].split("-");
			String a = "";
			String b = "";
			for(int k = 0; k < parsing2.length; k++){
				a += parsing2[k];
			}
			
			for(int j = 0; j < parsing4.length; j++){
				b += parsing4[j];
			
			startDate = Long.parseLong(a);
			endDate = Long.parseLong(b);
			
			if(toDay >= startDate && toDay <= endDate && BTMRecordList.get(i).getIsComplete() != 1){
				color = "#C2E0BA"; // 현재 진행중 - 녹색계열
				BTMRecordList.get(i).setColor(color);
			}else if(BTMRecordList.get(i).getIsComplete() == 1){
				color = "#oac9FF"; //푸른 계열 완료 색상
				BTMRecordList.get(i).setColor(color);
			}else{
				color = "#FFBDBD"; // 레드 달성실패
				BTMRecordList.get(i).setColor(color);
			}
		}// end for
		}
		
		return BTMRecordList;
	}

	@Override
	public ArrayList<BTMRecordVO> getIsProcessingRecord(String memberId) {
		return dao.getIsProcessingRecord(memberId);
	}

	@Override
	public ArrayList<DayRecordVO> getChartRecord(int bTMRecordNum,String memberId) {
		ArrayList<DayRecordVO> DayRecordList = dao.getChartRecord(bTMRecordNum);
		for (DayRecordVO dayRecordVO : DayRecordList) {
			dayRecordVO.setMemberId(memberId);
		}		
		return DayRecordList;
	}

	@Override
	public ArrayList<DayPlanVO> getDayRecordList(String userid) {
		ArrayList<DayPlanVO> DayRecordList = dao.getDayRecordList(userid);
		return DayRecordList;
	}

	@Override
	public ArrayList<DayPlanVO> getNomalPlanlist(String userid) {
		ArrayList<DayPlanVO> nomalPlanList = dao.getNomalPlanlist(userid);
		return nomalPlanList;
	}

	@Override
	public void deleteDayPlan(int dayPlanNum) {
		dao.deleteDayPlan(dayPlanNum);
	}

	@Override
	public void updateDayPlan(DayPlanVO vo) {
		dao.updateDayPlan(vo);
	}

	@Override
	public int createDayPlan(DayPlanVO vo) {
		return dao.createDayPlan(vo);
	}

	@Override
	public int getAchieve(DayRecordVO vo) {
		return dao.getAchieve(vo);
	}

	@Override
	public void updateAchieve(DayRecordVO vo) {
		int isProgressing = dao.checkBTMRecord(vo);
		//업데이트할 대상을 찾아오는 쿼리
		int targetBTMRecordNum = dao.isProgressing(vo);
		vo.setBtmRecordNum(targetBTMRecordNum);
		if(isProgressing == 0){
			dao.updateDayRecord(vo);
		}else if(isProgressing == 1){
			if(vo.getAchieve() == 100){
				System.out.println(111);
				dao.completeUpdateDayRecord(vo);
			}else{
				dao.updateDayRecord(vo);
			}
		}
	}

	@Override
	public int getDayAchieve(DayRecordVO vo) {
		return dao.getDayAchieve(vo);
	}

	@Override
	public int getBTMRecord(DayRecordVO vo) {
		return dao.getBTMRecord(vo);
	}

}

