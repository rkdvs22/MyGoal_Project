package com.test.goal.dao;

interface BoardDAO {
	public void boardList();	//�Խ��� ���
	public void boardRead();	//�Խñ� �б�
	public void replyList();	//��� ���
	public void writeReply();	//��� ����
	public void deleteReply();	//��� ����
	public void addGoal();	//��ǥ ���
	public void addHit();	//��ȸ�� ����
	public void addFavorite();	//���ƿ� �� ����
}
