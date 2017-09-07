package com.test.goal.dao;

interface BoardDAO {
	public void boardList();	//게시판 목록
	public void boardRead();	//게시글 읽기
	public void replyList();	//댓글 목록
	public void writeReply();	//댓글 쓰기
	public void deleteReply();	//댓글 삭제
	public void addGoal();	//목표 담기
	public void addHit();	//조회수 증가
	public void addFavorite();	//좋아요 수 증가
}
