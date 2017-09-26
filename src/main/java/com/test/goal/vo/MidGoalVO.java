package com.test.goal.vo;

/*
* 작성자 강주영
* MidGoal를 bean으로 사용하기 위함 2017-09-07(목)
* 이유정 2017-09-26 멤버변수 tGoalTitle 추가
*/
public class MidGoalVO {
	private int mGoalNum;
	private String tGoalTitle;
	private String mGoalTitle;
	private String mClear;
	private String mStartDate;
	private String mEndDate;
	private int tGoalNum;
	
	public MidGoalVO() {}

	public MidGoalVO(int mGoalNum, String tGoalTitle, String mGoalTitle, String mClear, String mStartDate,
			String mEndDate, int tGoalNum) {
		super();
		this.mGoalNum = mGoalNum;
		this.tGoalTitle = tGoalTitle;
		this.mGoalTitle = mGoalTitle;
		this.mClear = mClear;
		this.mStartDate = mStartDate;
		this.mEndDate = mEndDate;
		this.tGoalNum = tGoalNum;
	}

	public int getmGoalNum() {
		return mGoalNum;
	}

	public void setmGoalNum(int mGoalNum) {
		this.mGoalNum = mGoalNum;
	}

	public String gettGoalTitle() {
		return tGoalTitle;
	}

	public void settGoalTitle(String tGoalTitle) {
		this.tGoalTitle = tGoalTitle;
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
		return "MidGoalVO [mGoalNum=" + mGoalNum + ", tGoalTitle=" + tGoalTitle + ", mGoalTitle=" + mGoalTitle
				+ ", mClear=" + mClear + ", mStartDate=" + mStartDate + ", mEndDate=" + mEndDate + ", tGoalNum="
				+ tGoalNum + "]";
	}

}
