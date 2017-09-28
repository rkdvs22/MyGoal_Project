package com.test.goal.vo;

/*
작성자 윤선영
목표생성페이지 및 게시판의 인원수를 담기위해 생성 2017-09-13 (수)
*/

public class MainProgressVO {

	private int progressNum;
	private String type;
	private String mStart;
	private int maxMember;
	private String tGoalTitle;
	
	public MainProgressVO() { }

	public MainProgressVO(int progressNum, String type, String mStart, int maxMember, String tGoalTitle) {
		super();
		this.progressNum = progressNum;
		this.type = type;
		this.mStart = mStart;
		this.maxMember = maxMember;
		this.tGoalTitle = tGoalTitle;
	}

	public int getProgressNum() {
		return progressNum;
	}

	public void setProgressNum(int progressNum) {
		this.progressNum = progressNum;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getmStart() {
		return mStart;
	}

	public void setmStart(String mStart) {
		this.mStart = mStart;
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

	@Override
	public String toString() {
		return "MainProgressVO [progressNum=" + progressNum + ", type=" + type + ", mStart=" + mStart + ", maxMember="
				+ maxMember + ", tGoalTitle=" + tGoalTitle + "]";
	}
}
