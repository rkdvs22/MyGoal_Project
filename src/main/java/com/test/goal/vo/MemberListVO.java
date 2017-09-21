package com.test.goal.vo;

public class MemberListVO {

	private int listNum;
	private String ready;
	private String playerType;
	private String userId;
	private String color;
	private int progressNum;
	
	public MemberListVO() {}

	public MemberListVO(int listNum, String ready, String playerType, String userId, String color, int progressNum) {
		this.listNum = listNum;
		this.ready = ready;
		this.playerType = playerType;
		this.userId = userId;
		this.color = color;
		this.progressNum = progressNum;
	}



	public int getListNum() {
		return listNum;
	}

	public void setListNum(int listNum) {
		this.listNum = listNum;
	}

	public String getReady() {
		return ready;
	}

	public void setReady(String ready) {
		this.ready = ready;
	}

	public String getPlayerType() {
		return playerType;
	}

	public void setPlayerType(String playerType) {
		this.playerType = playerType;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getColor() {
		return color;
	}

	public void setColor(String color) {
		this.color = color;
	}

	public int getProgressNum() {
		return progressNum;
	}

	public void setProgressNum(int progressNum) {
		this.progressNum = progressNum;
	}

	@Override
	public String toString() {
		return "MemberListVO [listNum=" + listNum + ", ready=" + ready + ", playerType=" + playerType + ", userId="
				+ userId + ", color=" + color + ", progressNum=" + progressNum + "]";
	}
}
