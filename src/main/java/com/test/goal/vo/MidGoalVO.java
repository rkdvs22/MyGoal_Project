package com.test.goal.vo;

/*
* 작성자 강주영
* MidGoal를 bean으로 사용하기 위함 2017-09-07(목)
*/
public class MidGoalVO {
	private int mGoalNum;
	private String mGoalTitle;
	private String mClear;
	private String mStartDate;
	private String mEndDate;
	private int tGoalNum;
	
	public MidGoalVO() {}

	public int getmGoalNum() {
		return mGoalNum;
	}

	public void setmGoalNum(int mGoalNum) {
		this.mGoalNum = mGoalNum;
	}

	public String getmGoalTitle() {
		return mGoalTitle;
	}

	public void setmGoalTitle(String mGoalTitle) {
		this.mGoalTitle = mGoalTitle;
	}

	public String getmClear() {
		return mClear;
	}

	public void setmClear(String mClear) {
		this.mClear = mClear;
	}

	public String getmStartDate() {
		return mStartDate;
	}

	public void setmStartDate(String mStartDate) {
		this.mStartDate = mStartDate;
	}

	public String getmEndDate() {
		return mEndDate;
	}

	public void setmEndDate(String mEndDate) {
		this.mEndDate = mEndDate;
	}

	public int gettGoalNum() {
		return tGoalNum;
	}

	public void settGoalNum(int tGoalNum) {
		this.tGoalNum = tGoalNum;
	}

	@Override
	public String toString() {
		return "MidGoal [mGoalNum=" + mGoalNum + ", mGoalTitle=" + mGoalTitle + ", mClear=" + mClear + ", mStartDate="
				+ mStartDate + ", mEndDate=" + mEndDate + ", tGoalNum=" + tGoalNum + "]";
	}
	
}
