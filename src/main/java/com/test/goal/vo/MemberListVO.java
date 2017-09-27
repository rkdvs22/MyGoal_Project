package com.test.goal.vo;

public class MemberListVO {

	private int listNum;
	private String ready;
	private String playerType;
	private String userid;
	private String color;
	private int progressNum;
	private String image;
	
	public MemberListVO() {}

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

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "MemberListVO [listNum=" + listNum + ", ready=" + ready + ", playerType=" + playerType + ", userid="
				+ userid + ", color=" + color + ", progressNum=" + progressNum + ", image=" + image + "]";
	}
}
