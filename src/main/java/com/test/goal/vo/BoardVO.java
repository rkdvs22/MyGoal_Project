package com.test.goal.vo;

public class BoardVO {
	private int boardnum;
	private String userid;
	private int hit;
	private int favorite;
	private int tgoalnum;
	
	public BoardVO() {
		
	}
	
	public BoardVO(int boardnum, String userid, int hit, int favorite, int tgoalnum) {
		super();
		this.boardnum = boardnum;
		this.userid = userid;
		this.hit = hit;
		this.favorite = favorite;
		this.tgoalnum = tgoalnum;
	}

	public int getBoardnum() {
		return boardnum;
	}

	public void setBoardnum(int boardnum) {
		this.boardnum = boardnum;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public int getFavorite() {
		return favorite;
	}

	public void setFavorite(int favorite) {
		this.favorite = favorite;
	}

	public int getTgoalnum() {
		return tgoalnum;
	}

	public void setTgoalnum(int tgoalnum) {
		this.tgoalnum = tgoalnum;
	}

	@Override
	public String toString() {
		return "BoardVO [boardnum=" + boardnum + ", userid=" + userid + ", hit=" + hit + ", favorite=" + favorite
				+ ", tgoalnum=" + tgoalnum + "]";
	}
	
	
}
