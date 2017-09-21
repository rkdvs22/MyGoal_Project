package com.test.goal.vo;

public class BoardVO {
	private int boardnum;
	private String userid;
	private int favorite;
	private int tGoalNum;
	private String startDate;
	private String endDate;
	private int currentMemberNumber; 
	private int maxMember;
	private String tGoalTitle;
	private String openStatus;
	private int progressNum;
	
	public BoardVO() {	}

	public BoardVO(int boardnum, String userid, int favorite, int tGoalNum, String startDate, String endDate,
			int currentMemberNumber, int maxMember, String tGoalTitle, String openStatus, int progressNum) {
		this.boardnum = boardnum;
		this.userid = userid;
		this.favorite = favorite;
		this.tGoalNum = tGoalNum;
		this.startDate = startDate;
		this.endDate = endDate;
		this.currentMemberNumber = currentMemberNumber;
		this.maxMember = maxMember;
		this.tGoalTitle = tGoalTitle;
		this.openStatus = openStatus;
		this.progressNum = progressNum;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getFavorite() {
		return favorite;
	}

	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}

	public int gettGoalNum() {
		return tGoalNum;
	}

	public void settGoalNum(int tGoalNum) {
		this.tGoalNum = tGoalNum;
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

	public int getCurrentMemberNumber() {
		return currentMemberNumber;
	}

	public void setCurrentMemberNumber(int currentMemberNumber) {
		this.currentMemberNumber = currentMemberNumber;
	}

	public int getMaxMember() {
		return maxMember;
	}

	public void setMaxMember(int maxMember) {
		this.maxMember = maxMember;
	}

	public String gettGoalTitle() {
		return tGoalTitle;
	}

	public void settGoalTitle(String tGoalTitle) {
		this.tGoalTitle = tGoalTitle;
	}

	public String getOpenStatus() {
		return openStatus;
	}

	public void setOpenStatus(String openStatus) {
		this.openStatus = openStatus;
	}

	public int getProgressNum() {
		return progressNum;
	}

	public void setProgressNum(int progressNum) {
		this.progressNum = progressNum;
	}

	@Override
	public String toString() {
		return "BoardVO [boardnum=" + boardnum + ", userid=" + userid + ", favorite=" + favorite + ", tGoalNum="
				+ tGoalNum + ", startDate=" + startDate + ", endDate=" + endDate + ", currentMemberNumber="
				+ currentMemberNumber + ", maxMember=" + maxMember + ", tGoalTitle=" + tGoalTitle + ", openStatus="
				+ openStatus + ", progressNum=" + progressNum + "]";
	}

	
}
