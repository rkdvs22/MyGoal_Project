package com.test.goal.vo;

public class MyFriendVO {
	private String userid;
	private String frdid;
	private String image;
	
	public MyFriendVO() {
		
	}

	public MyFriendVO(String userid, String frdid, String image) {
		super();
		this.userid = userid;
		this.frdid = frdid;
		this.image = image;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "MyFriendVO [userid=" + userid + ", frdid=" + frdid + ", image=" + image + "]";
	}
	
	
	
}
