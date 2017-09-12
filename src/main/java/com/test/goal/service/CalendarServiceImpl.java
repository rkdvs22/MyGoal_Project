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
			String[] parsing4 = parsing1[0].split("-");
			String a = "";
			String b = "";
			for(int k = 0; k < parsing2.length; k++){
				a += parsing2[k];
			}
			
			for(int j = 0; j < parsing4.length; j++){
				b += parsing4[j];
			}
					
			startDate = Long.parseLong(a);
			endDate = Long.parseLong(b);
					
			if(startDate <= toDay && toDay >= endDate && BTMRecordList.get(i).getIsComplete() != 1){
				color = "#fd9697"; // 현재 진행중 - 노랑계열
				BTMRecordList.get(i).setColor(color);
			}else if(BTMRecordList.get(i).getIsComplete() == 1){
				color = "#b9e8fd"; //푸른 계열 완료 색상
				BTMRecordList.get(i).setColor(color);
			}
			else{
				color = "#fee0d2"; // 레드 달성실패
				BTMRecordList.get(i).setColor(color);
			}
		}// end for
		
		return BTMRecordList;
	}

}
