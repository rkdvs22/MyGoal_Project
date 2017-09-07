package com.test.goal.dao;

public interface BTMGoalDAO {
	public void getBTMGoalList();	//세부 목표 목록 가져오기
	public void randomAllocate();	//유저 랜덤 배치
	
	public void insertBTMRecord();	//세부 목표에 대한 기록 등록
	public void updateBTMRecord();	//세부 기록 수정
	public void ranking();	//세부 기록의 1위 등록
	public void takeCalendar();	//달력 페이지로 이동
	public void insertPeriodCalendar();	//달력에 기간 및 제목 입력
	
	public void insertDayRecord();	//일일 기록 입력
	public void updateDayRecord();	//일일 기록 수정
	public void finishDayRecord();	//자정 자동 마감
	public void insertDRCalandar();	//달력에 일일 기록 입력
	
}
