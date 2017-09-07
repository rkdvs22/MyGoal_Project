package com.test.goal.vo;

public class MemberVO {
	private String userid;
	private String password;
	private String email;
	private String tel1;
	private String tel2;
	private String tel3;
	private String image;
	
	public MemberVO() {
		
	}
	
	public MemberVO(String userid, String password, String email, String tel1, String tel2, String tel3, String image) {
		super();
		this.userid = userid;
		this.password = password;
		this.email = email;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.image = image;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	@Override
	public String toString() {
		return "MemberVO [userid=" + userid + ", password=" + password + ", email=" + email + ", tel1=" + tel1
				+ ", tel2=" + tel2 + ", tel3=" + tel3 + ", image=" + image + "]";
	}

	
}
