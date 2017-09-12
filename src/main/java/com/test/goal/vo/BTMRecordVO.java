package com.test.goal.vo;

/*
* 작성자 강주영
* BTMRecord를 bean으로 사용하기 위함 2017-09-07(목)
*/
public class BTMRecordVO {
	
	private int bRecordNum;
	private String startDate;
	private String endDate;
	private String memberId;
	private int btmSectionNum;
	private int bGoalNum;
	private int calendarNum;
	private int period;
	private String clear;
	private String BGoalTitle;
	private int isComplete;
	private String mGoalTitle;
	private String color;
	private int achievePercent;
	
	public BTMRecordVO() {
	}

	public int getbRecordNum() {
		return bRecordNum;
	}

	public void setbRecordNum(int bRecordNum) {
		this.bRecordNum = bRecordNum;
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

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getBtmSectionNum() {
		return btmSectionNum;
	}

	public void setBtmSectionNum(int btmSectionNum) {
		this.btmSectionNum = btmSectionNum;
	}

	public int getbGoalNum() {
		return bGoalNum;
	}

	public void setbGoalNum(int bGoalNum) {
		this.bGoalNum = bGoalNum;
	}

	public int getCalendarNum() {
		return calendarNum;
	}

	public void setCalendarNum(int calendarNum) {
		this.calendarNum = calendarNum;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public String getClear() {
		return clear;
	}

	public void setClear(String clear) {
		this.clear = clear;
	}

	public String getBGoalTitle() {
		return BGoalTitle;
	}

	public void setBGoalTitle(String bGoalTitle) {
		BGoalTitle = bGoalTitle;
	}

	public int getIsComplete() {
		return isComplete;
	}

	public void setIsComplete(int isComplete) {
		this.isComplete = isComplete;
	}

	public String getmGoalTitle() {
		return mGoalTitle;
	}

	public void setmGoalTitle(String mGoalTitle) {
		this.mGoalTitle = mGoalTitle;
	}
	
	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}
	
	public int getAchievePercent() {
		return achievePercent;
	}

	public void setAchievePercent(int achievePercent) {
		this.achievePercent = achievePercent;
	}

	@Override
	public String toString() {
		return "BTMRecordVO [bRecordNum=" + bRecordNum + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", memberId=" + memberId + ", btmSectionNum=" + btmSectionNum + ", bGoalNum=" + bGoalNum
				+ ", calendarNum=" + calendarNum + ", period=" + period + ", clear=" + clear + ", BGoalTitle="
				+ BGoalTitle + ", isComplete=" + isComplete + ", mGoalTitle=" + mGoalTitle + ", color=" + color
				+ ", achievePercent=" + achievePercent + "]";
	}

}
