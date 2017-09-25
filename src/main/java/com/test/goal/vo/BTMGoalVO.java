package com.test.goal.vo;


/*
* 작성자 강주영
* BTMGoal를 bean으로 사용하기 위함 2017-09-07(목)
*/
public class BTMGoalVO {
	
	private int bGoalNum;
	private String bGoalTitle;
	private String bClear;
	private int period;
	private String rankingId;
	private int mGoalNum;
	private int achieve;
	
	public BTMGoalVO() {
	}

	public int getbGoalNum() {
		return bGoalNum;
	}

	public void setbGoalNum(int bGoalNum) {
		this.bGoalNum = bGoalNum;
	}

	public String getbGoalTitle() {
		return bGoalTitle;
	}

	public void setbGoalTitle(String bGoalTitle) {
		this.bGoalTitle = bGoalTitle;
	}

	public String getbClear() {
		return bClear;
	}

	public void setbClear(String bClear) {
		this.bClear = bClear;
	}

	public int getPeriod() {
		return period;
	}

	public void setPeriod(int period) {
		this.period = period;
	}

	public String getRankingId() {
		return rankingId;
	}

	public void setRankingId(String rankingId) {
		this.rankingId = rankingId;
	}

	public int getmGoalNum() {
		return mGoalNum;
	}

	public void setmGoalNum(int mGoalNum) {
		this.mGoalNum = mGoalNum;
	}

	public int getAchieve() {
		return achieve;
	}

	public void setAchieve(int achieve) {
		this.achieve = achieve;
	}

	@Override
	public String toString() {
		return "BTMGoalVO [bGoalNum=" + bGoalNum + ", bGoalTitle=" + bGoalTitle + ", bClear=" + bClear + ", period="
				+ period + ", rankingId=" + rankingId + ", mGoalNum=" + mGoalNum + ", achieve=" + achieve + "]";
	}
		
}
