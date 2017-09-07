package com.test.goal.vo;

/*
* 작성자 강주영
* FindMemberColor를 bean으로 사용하기 위함 2017-09-07(목)
* 테이블에 없는 클래스임.
*/
public class FindMemberColor {
	private String memberId;
	private int progressNum;
	
	public FindMemberColor() {
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getProgressNum() {
		return progressNum;
	}

	public void setProgressNum(int progressNum) {
		this.progressNum = progressNum;
	}

	@Override
	public String toString() {
		return "FindMemberColor [memberId=" + memberId + ", progressNum=" + progressNum + "]";
	}
	
}
