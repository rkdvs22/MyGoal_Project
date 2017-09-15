package com.test.goal.vo;

public class BoardVO {
	private int boardnum;
	private String userid;
	private int hit;
	private int favorite;
	private int tgoalnum;
	private String startDate;
	private String endDate;
	private int currentMemberNumber; 
	private int maxMemberNumber;
	private String tGoalTitle;
	private String openStatus;
	
	public BoardVO() {
		
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

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getFavorite() {
		return favorite;
	}

	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}

	public int getTgoalnum() {
		return tgoalnum;
	}

	public void setTgoalnum(int tgoalnum) {
		this.tgoalnum = tgoalnum;
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

	public int getMaxMemberNumber() {
		return maxMemberNumber;
	}

	public void setMaxMemberNumber(int maxMemberNumber) {
		this.maxMemberNumber = maxMemberNumber;
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

	@Override
	public String toString() {
		return "BoardVO [boardnum=" + boardnum + ", userid=" + userid + ", hit=" + hit + ", favorite=" + favorite
				+ ", tgoalnum=" + tgoalnum + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", currentMemberNumber=" + currentMemberNumber + ", maxMemberNumber=" + maxMemberNumber
				+ ", tGoalTitle=" + tGoalTitle + ", openStatus=" + openStatus + "]";
	}

}
