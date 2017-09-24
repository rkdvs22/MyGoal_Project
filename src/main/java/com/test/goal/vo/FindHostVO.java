package com.test.goal.vo;

public class FindHostVO {
	
	private String myId;
	private int tGoalNum;
	
	public FindHostVO() {}

	public FindHostVO(String myId, int tGoalNum) {
		this.myId = myId;
		this.tGoalNum = tGoalNum;
	}

	public String getMyId() {
		return myId;
	}

	public void setMyId(String myId) {
		this.myId = myId;
	}

	public int gettGoalNum() {
		return tGoalNum;
	}

	public void settGoalNum(int tGoalNum) {
		this.tGoalNum = tGoalNum;
	}

	@Override
	public String toString() {
		return "FindHostVO [myId=" + myId + ", tGoalNum=" + tGoalNum + "]";
	}
}
