package com.test.goal.vo;

/*
* 작성자 강주영
* InsertDayRecord를 bean으로 사용하기 위함 2017-09-07(목)
* 테이블에 없는 클래스임.
*/
public class InsertDayRecord {
	
	private int period;
	private String memberColor;
	private int calendarNum;
	private int btmRecordNum;
	private String startDate;
	
	public InsertDayRecord() {
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public String getMemberColor() {
		return memberColor;
	}

	public void setMemberColor(String memberColor) {
		this.memberColor = memberColor;
	}

	public int getCalendarNum() {
		return calendarNum;
	}

	public void setCalendarNum(int calendarNum) {
		this.calendarNum = calendarNum;
	}

	public int getBtmRecordNum() {
		return btmRecordNum;
	}

	public void setBtmRecordNum(int btmRecordNum) {
		this.btmRecordNum = btmRecordNum;
	}
	
	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	@Override
	public String toString() {
		return "InsertDayRecord [period=" + period + ", memberColor=" + memberColor + ", calendarNum=" + calendarNum
				+ ", btmRecordNum=" + btmRecordNum + ", startDate=" + startDate + "]";
	}

}
