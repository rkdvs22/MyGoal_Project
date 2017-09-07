package com.test.goal.vo;

public class MyFriendVO {
	private String userid;
	private String frdid;
	
	public MyFriendVO() {
		
	}
	
	public MyFriendVO(String userid, String frdid) {
		super();
		this.userid = userid;
		this.frdid = frdid;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getFrdid() {
		return frdid;
	}

	public void setFrdid(String frdid) {
		this.frdid = frdid;
	}

	@Override
	public String toString() {
		return "MyFriendVO [userid=" + userid + ", frdid=" + frdid + "]";
	}
	
	
}
