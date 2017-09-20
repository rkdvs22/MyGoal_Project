package com.test.goal.vo;

import java.util.Date;

/*작성자 윤선영
목표생성할때 사용하기 위함 2017-09-12 (수)
*/

public class TopGoalVO {
	private int tGoalNum;
	private String tGoalTitle;
	private String tStartDate;
	private String tEndDate;
	private String tClear;
	private String tStartStatus;
	private String openStatus;
	private String userid;
	private int progressNum;

	
	public TopGoalVO() {}


	public int gettGoalNum() {
		return tGoalNum;
	}


	public void settGoalNum(int tGoalNum) {
		this.tGoalNum = tGoalNum;
	}


	public String gettGoalTitle() {
		return tGoalTitle;
	}


	public void settGoalTitle(String tGoalTitle) {
		this.tGoalTitle = tGoalTitle;
	}


	public String gettStartDate() {
		return tStartDate;
	}


	public void settStartDate(String tStartDate) {
		this.tStartDate = tStartDate;
	}


	public String gettEndDate() {
		return tEndDate;
	}


	public void settEndDate(String tEndDate) {
		this.tEndDate = tEndDate;
	}


	public String gettClear() {
		return tClear;
	}


	public void settClear(String tClear) {
		this.tClear = tClear;
	}


	public String gettStartStatus() {
		return tStartStatus;
	}


	public void settStartStatus(String tStartStatus) {
		this.tStartStatus = tStartStatus;
	}


	public String getOpenStatus() {
		return openStatus;
	}


	public void setOpenStatus(String openStatus) {
		this.openStatus = openStatus;
	}


	public String getUserid() {
		return userid;
	}


	public void setUserid(String userid) {
		this.userid = userid;
	}


	public int getProgressNum() {
		return progressNum;
	}


	public void setProgressNum(int progressNum) {
		this.progressNum = progressNum;
	}


	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((openStatus == null) ? 0 : openStatus.hashCode());
		result = prime * result + progressNum;
		result = prime * result + ((tClear == null) ? 0 : tClear.hashCode());
		result = prime * result + ((tEndDate == null) ? 0 : tEndDate.hashCode());
		result = prime * result + tGoalNum;
		result = prime * result + ((tGoalTitle == null) ? 0 : tGoalTitle.hashCode());
		result = prime * result + ((tStartDate == null) ? 0 : tStartDate.hashCode());
		result = prime * result + ((tStartStatus == null) ? 0 : tStartStatus.hashCode());
		result = prime * result + ((userid == null) ? 0 : userid.hashCode());
		return result;
	}


	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		TopGoalVO other = (TopGoalVO) obj;
		if (openStatus == null) {
			if (other.openStatus != null)
				return false;
		} else if (!openStatus.equals(other.openStatus))
			return false;
		if (progressNum != other.progressNum)
			return false;
		if (tClear == null) {
			if (other.tClear != null)
				return false;
		} else if (!tClear.equals(other.tClear))
			return false;
		if (tEndDate == null) {
			if (other.tEndDate != null)
				return false;
		} else if (!tEndDate.equals(other.tEndDate))
			return false;
		if (tGoalNum != other.tGoalNum)
			return false;
		if (tGoalTitle == null) {
			if (other.tGoalTitle != null)
				return false;
		} else if (!tGoalTitle.equals(other.tGoalTitle))
			return false;
		if (tStartDate == null) {
			if (other.tStartDate != null)
				return false;
		} else if (!tStartDate.equals(other.tStartDate))
			return false;
		if (tStartStatus == null) {
			if (other.tStartStatus != null)
				return false;
		} else if (!tStartStatus.equals(other.tStartStatus))
			return false;
		if (userid == null) {
			if (other.userid != null)
				return false;
		} else if (!userid.equals(other.userid))
			return false;
		return true;
	}


	@Override
	public String toString() {
		return "TopGoalVO [tGoalNum=" + tGoalNum + ", tGoalTitle=" + tGoalTitle + ", tStartDate=" + tStartDate
				+ ", tEndDate=" + tEndDate + ", tClear=" + tClear + ", tStartStatus=" + tStartStatus + ", openStatus="
				+ openStatus + ", userid=" + userid + ", progressNum=" + progressNum + "]";
	}



	
}
