package com.test.goal.vo;

/*
* 작성자 강주영
* Calendar를 bean으로 사용하기 위함 2017-09-07(목)
*/
public class CalendarVO {
	private int calendarNum;
	private String memberId;
	
	public CalendarVO() {
	}

	public int getCalendarNum() {
		return calendarNum;
	}

	public void setCalendarNum(int calendarNum) {
		this.calendarNum = calendarNum;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "CalendarVO [calendarNum=" + calendarNum + ", memberId=" + memberId + "]";
	}
	
}
