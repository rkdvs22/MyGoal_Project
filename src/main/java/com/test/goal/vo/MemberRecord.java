package com.test.goal.vo;


/*
* 작성자 강주영
* MemberRecord를 bean으로 사용하기 위함 2017-09-07(목)
* 테이블에 없는 클래스임.
*/
public class MemberRecord {
	
	private String bGoalTitle;
	private String memberId;
	private int achieve;
	private String takeTime;
	private String isEnd;
	private int BTMRecordNum;
	
	public MemberRecord() {
	}

	public String getbGoalTitle() {
		return bGoalTitle;
	}

	public void setbGoalTitle(String bGoalTitle) {
		this.bGoalTitle = bGoalTitle;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getAchieve() {
		return achieve;
	}

	public void setAchieve(int achieve) {
		this.achieve = achieve;
	}

	public String getTakeTime() {
		return takeTime;
	}

	public void setTakeTime(String takeTime) {
		this.takeTime = takeTime;
	}

	public String getIsEnd() {
		return isEnd;
	}

	public void setIsEnd(String isEnd) {
		this.isEnd = isEnd;
	}
	
	public int getBTMRecordNum() {
		return BTMRecordNum;
	}

	public void setBTMRecordNum(int bTMRecordNum) {
		BTMRecordNum = bTMRecordNum;
	}

	@Override
	public String toString() {
		return "MemberRecord [bGoalTitle=" + bGoalTitle + ", memberId=" + memberId + ", achieve=" + achieve
				+ ", takeTime=" + takeTime + ", isEnd=" + isEnd + ", BTMRecordNum=" + BTMRecordNum + "]";
	}

}
