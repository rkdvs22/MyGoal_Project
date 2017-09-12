package com.test.goal.vo;

import java.util.Date;

public class TopGoalVO {
	private int tgoalnum;
	private String tgoaltitle;
	private Date tstartdate;
	private Date tenddate;
	private String tclear;
	private String tstartstatus;
	private String openstatus;
	private String userid;
	private int progressnum;
	private int calendarnum;
	
	
	public TopGoalVO() {
		super();
	}


	public TopGoalVO(int tgoalnum, String tgoaltitle, Date tstartdate, Date tenddate, String tclear,
			String tstartstatus, String openstatus, String userid, int progressnum, int calendarnum) {
		super();
		this.tgoalnum = tgoalnum;
		this.tgoaltitle = tgoaltitle;
		this.tstartdate = tstartdate;
		this.tenddate = tenddate;
		this.tclear = tclear;
		this.tstartstatus = tstartstatus;
		this.openstatus = openstatus;
		this.userid = userid;
		this.progressnum = progressnum;
		this.calendarnum = calendarnum;
	}


	public int getTgoalnum() {
		return tgoalnum;
	}


	public void setTgoalnum(int tgoalnum) {
		this.tgoalnum = tgoalnum;
	}


	public String getTgoaltitle() {
		return tgoaltitle;
	}


	public void setTgoaltitle(String tgoaltitle) {
		this.tgoaltitle = tgoaltitle;
	}


	public Date getTstartdate() {
		return tstartdate;
	}


	public void setTstartdate(Date tstartdate) {
		this.tstartdate = tstartdate;
	}


	public Date getTenddate() {
		return tenddate;
	}


	public void setTenddate(Date tenddate) {
		this.tenddate = tenddate;
	}


	public String getTclear() {
		return tclear;
	}


	public void setTclear(String tclear) {
		this.tclear = tclear;
	}


	public String getTstartstatus() {
		return tstartstatus;
	}


	public void setTstartstatus(String tstartstatus) {
		this.tstartstatus = tstartstatus;
	}


	public String getOpenstatus() {
		return openstatus;
	}


	public void setOpenstatus(String openstatus) {
		this.openstatus = openstatus;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public int getProgressnum() {
		return progressnum;
	}


	public void setProgressnum(int progressnum) {
		this.progressnum = progressnum;
	}


	public int getCalendarnum() {
		return calendarnum;
	}


	public void setCalendarnum(int calendarnum) {
		this.calendarnum = calendarnum;
	}


	@Override
	public String toString() {
		return "TopGoalVO [tgoalnum=" + tgoalnum + ", tgoaltitle=" + tgoaltitle + ", tstartdate=" + tstartdate
				+ ", tenddate=" + tenddate + ", tclear=" + tclear + ", tstartstatus=" + tstartstatus + ", openstatus="
				+ openstatus + ", userid=" + userid + ", progressnum=" + progressnum + ", calendarnum=" + calendarnum
				+ "]";
	}
	
	
}
