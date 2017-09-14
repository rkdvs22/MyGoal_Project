package com.test.goal.vo;

public class GoalTreeVO {
	private String userid;
	private String tGoalNum;
	private String tGoalTitle;
	private String tStartYear;
	
	public GoalTreeVO() {
		
	}

	public GoalTreeVO(String userid, String tGoalNum, String tGoalTitle, String tStartYear) {
		super();
		this.userid = userid;
		this.tGoalNum = tGoalNum;
		this.tGoalTitle = tGoalTitle;
		this.tStartYear = tStartYear;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String gettGoalNum() {
		return tGoalNum;
	}

	public void settGoalNum(String tGoalNum) {
		this.tGoalNum = tGoalNum;
	}

	public String gettGoalTitle() {
		return tGoalTitle;
	}

	public void settGoalTitle(String tGoalTitle) {
		this.tGoalTitle = tGoalTitle;
	}

	public String gettStartYear() {
		return tStartYear;
	}

	public void settStartYear(String tStartYear) {
		this.tStartYear = tStartYear;
	}

	@Override
	public String toString() {
		return "GoalTreeVO [userid=" + userid + ", tGoalNum=" + tGoalNum + ", tGoalTitle=" + tGoalTitle
				+ ", tStartYear=" + tStartYear + "]";
	}

}
