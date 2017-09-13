package com.test.goal.vo;

import java.util.Date;

/*작성자 윤선영
목표생성할때 사용하기 위함 2017-09-12 (수)
*/

public class TopGoalVO {
	private int tGoalNum;
	private String tGoalTitle;
	private Date tStartDate;
	private Date tEndDate;
	private String tClear;
	private String tStartStatus;
	private String openStatus;
	private String userid;
	private int progressNum;
	private int calendarNum;
	
	
	public TopGoalVO() {
		super();
	}


	public TopGoalVO(int tGoalNum, String tGoalTitle, Date tStartDate, Date tEndDate, String tClear,
			String tStartStatus, String openStatus, String userid, int progressNum, int calendarNum) {
		super();
		this.tGoalNum = tGoalNum;
		this.tGoalTitle = tGoalTitle;
		this.tStartDate = tStartDate;
		this.tEndDate = tEndDate;
		this.tClear = tClear;
		this.tStartStatus = tStartStatus;
		this.openStatus = openStatus;
		this.userid = userid;
		this.progressNum = progressNum;
		this.calendarNum = calendarNum;
	}


	public int gettGoalNum() {
		return tGoalNum;
	}


	public void settGoalNum(int tGoalNum) {
		this.tGoalNum = tGoalNum;
	}


	public String gettGoalTitle() {
		return tGoalTitle;
	}


	public void settGoalTitle(String tGoalTitle) {
		this.tGoalTitle = tGoalTitle;
	}


	public Date gettStartDate() {
		return tStartDate;
	}


	public void settStartDate(Date tStartDate) {
		this.tStartDate = tStartDate;
	}


	public Date gettEndDate() {
		return tEndDate;
	}


	public void settEndDate(Date tEndDate) {
		this.tEndDate = tEndDate;
	}


	public String gettClear() {
		return tClear;
	}


	public void settClear(String tClear) {
		this.tClear = tClear;
	}


	public String gettStartStatus() {
		return tStartStatus;
	}


	public void settStartStatus(String tStartStatus) {
		this.tStartStatus = tStartStatus;
	}


	public String getopenStatus() {
		return openStatus;
	}


	public void setopenStatus(String openStatus) {
		this.openStatus = openStatus;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public int getprogressNum() {
		return progressNum;
	}


	public void setprogressNum(int progressNum) {
		this.progressNum = progressNum;
	}


	public int getcalendarNum() {
		return calendarNum;
	}


	public void setcalendarNum(int calendarNum) {
		this.calendarNum = calendarNum;
	}


	@Override
	public String toString() {
		return "TopGoalVO [tGoalNum=" + tGoalNum + ", tGoalTitle=" + tGoalTitle + ", tStartDate=" + tStartDate
				+ ", tEndDate=" + tEndDate + ", tClear=" + tClear + ", tStartStatus=" + tStartStatus + ", openStatus="
				+ openStatus + ", userid=" + userid + ", progressNum=" + progressNum + ", calendarNum=" + calendarNum
				+ "]";
	}
	
	
}
