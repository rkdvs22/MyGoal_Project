package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import com.test.goal.vo.BoardVO;
import com.test.goal.vo.TopGoalVO;

public interface BoardDAO {
	public ArrayList<TopGoalVO> boardList();	// 게시글 목록
	public void boardRead();	//�Խñ� �б�
	public void replyList();	//��� ���
	public void writeReply();	//��� ����
	public void deleteReply();	//��� ����
	public void addGoal();	//��ǥ ���
	public void addHit();	//��ȸ�� ����
	public void addFavorite();	//���ƿ� �� ����
	public ArrayList<BoardVO> searchBoard(Map<String, String> map); // 게시글 검색
}
