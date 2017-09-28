package com.test.goal.vo;

import java.io.Serializable;
import java.util.Date;

/*작성자 윤선영
목표생성할때 사용하기 위함 2017-09-12 (수)
*/

public class TopGoalVO implements Serializable{
	private int tGoalNum;
	private String tGoalTitle;
	private String tStartDate;
	private String tEndDate;
	private String tClear;
	private String tStartStatus;
	private String openStatus;
	private String userid;
	private int progressNum;
	private String color;
	private int maxMember;
	private String type;
	private String progressNumS;
	private String maxMemberS;
	
	public TopGoalVO() {}
	

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



	public String gettStartDate() {
		return tStartDate;
	}



	public void settStartDate(String tStartDate) {
		this.tStartDate = tStartDate;
	}



	public String gettEndDate() {
		return tEndDate;
	}



	public void settEndDate(String tEndDate) {
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



	public String getOpenStatus() {
		return openStatus;
	}



	public void setOpenStatus(String openStatus) {
		this.openStatus = openStatus;
	}



	public String getUserid() {
		return userid;
	}



	public void setUserid(String userid) {
		this.userid = userid;
	}



	public int getProgressNum() {
		return progressNum;
	}



	public void setProgressNum(int progressNum) {
		this.progressNum = progressNum;
	}



	public String getColor() {
		return color;
	}



	public void setColor(String color) {
		this.color = color;
	}



	public int getMaxMember() {
		return maxMember;
	}



	public void setMaxMember(int maxMember) {
		this.maxMember = maxMember;
	}



	public String getType() {
		return type;
	}



	public void setType(String type) {
		this.type = type;
	}



	public String getProgressNumS() {
		return progressNumS;
	}



	public void setProgressNumS(String progressNumS) {
		this.progressNumS = progressNumS;
	}



	public String getMaxMemberS() {
		return maxMemberS;
	}



	public void setMaxMemberS(String maxMemberS) {
		this.maxMemberS = maxMemberS;
	}



	@Override
	public String toString() {
		return "TopGoalVO [tGoalNum=" + tGoalNum + ", tGoalTitle=" + tGoalTitle + ", tStartDate=" + tStartDate
				+ ", tEndDate=" + tEndDate + ", tClear=" + tClear + ", tStartStatus=" + tStartStatus + ", openStatus="
				+ openStatus + ", userid=" + userid + ", progressNum=" + progressNum + ", color=" + color
				+ ", maxMember=" + maxMember + ", type=" + type + ", progressNumS=" + progressNumS + ", maxMemberS="
				+ maxMemberS + "]";
	}
}
