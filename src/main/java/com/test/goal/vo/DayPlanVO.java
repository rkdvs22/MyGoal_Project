package com.test.goal.vo;

public class DayPlanVO {
	
	private int dayPlanNum;
	private String startTime;
	private String endTime;
	private String dContents;
	private String dComplete;
	private int dayRecordNum;
	private String startDate;
	private String endDate;
	private int btmRecordNum;
	private int achieve;
	private String BTMstartDate;
	private String BTMendDate;
	private String userId;
	private String getToday;
	
	public int getDayPlanNum() {
		return dayPlanNum;
	}
	public void setDayPlanNum(int dayPlanNum) {
		this.dayPlanNum = dayPlanNum;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getdContents() {
		return dContents;
	}
	public void setdContents(String dContents) {
		this.dContents = dContents;
	}
	public String getdComplete() {
		return dComplete;
	}
	public void setdComplete(String dComplete) {
		this.dComplete = dComplete;
	}
	public int getDayRecordNum() {
		return dayRecordNum;
	}
	public void setDayRecordNum(int dayRecordNum) {
		this.dayRecordNum = dayRecordNum;
	}
	
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	
	public int getBtmRecordNum() {
		return btmRecordNum;
	}
	public void setBtmRecordNum(int btmRecordNum) {
		this.btmRecordNum = btmRecordNum;
	}
	public int getAchieve() {
		return achieve;
	}
	public void setAchieve(int achieve) {
		this.achieve = achieve;
	}
	
	public String getBTMstartDate() {
		return BTMstartDate;
	}
	public void setBTMstartDate(String bTMstartDate) {
		BTMstartDate = bTMstartDate;
	}
	public String getBTMendDate() {
		return BTMendDate;
	}
	public void setBTMendDate(String bTMendDate) {
		BTMendDate = bTMendDate;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	
	public String getGetToday() {
		return getToday;
	}
	public void setGetToday(String getToday) {
		this.getToday = getToday;
	}
	
	@Override
	public String toString() {
		return "DayPlanVO [dayPlanNum=" + dayPlanNum + ", startTime=" + startTime + ", endTime=" + endTime
				+ ", dContents=" + dContents + ", dComplete=" + dComplete + ", dayRecordNum=" + dayRecordNum
				+ ", startDate=" + startDate + ", endDate=" + endDate + ", btmRecordNum=" + btmRecordNum + ", achieve="
				+ achieve + ", BTMstartDate=" + BTMstartDate + ", BTMendDate=" + BTMendDate + ", userId=" + userId
				+ ", getToday=" + getToday + "]";
	}
	
	
}
