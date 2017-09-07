package com.test.goal.vo;

/*
* 작성자 강주영
* DayRecord를 bean으로 사용하기 위함 2017-09-07(목)
*/
public class DayRecordVO {
	private int dayRecordNum;
	private int achieve;
	private String color;
	private String startDate;
	private String completeTime;
	private String status;
	private int calendarNum;
	private int btmRecordNum;
	
	
	public DayRecordVO() {
	}


	public int getDayRecordNum() {
		return dayRecordNum;
	}


	public void setDayRecordNum(int dayRecordNum) {
		this.dayRecordNum = dayRecordNum;
	}


	public int getAchieve() {
		return achieve;
	}


	public void setAchieve(int achieve) {
		this.achieve = achieve;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getStartDate() {
		return startDate;
	}


	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}


	public String getCompleteTime() {
		return completeTime;
	}


	public void setCompleteTime(String completeTime) {
		this.completeTime = completeTime;
	}


	public String getStatus() {
		return status;
	}


	public void setStatus(String status) {
		this.status = status;
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


	@Override
	public String toString() {
		return "DayRecordVO [dayRecordNum=" + dayRecordNum + ", achieve=" + achieve + ", color=" + color
				+ ", startDate=" + startDate + ", completeTime=" + completeTime + ", status=" + status
				+ ", calendarNum=" + calendarNum + ", btmRecordNum=" + btmRecordNum + "]";
	}


}
