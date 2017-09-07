package com.test.goal.dao;

public interface SquareDAO {
	public void createGoal();	//�ֻ��� ��ǥ ����
	public void updateGoalTheme();	//�ֻ��� ��ǥ �� �߰� ��ǥ ���� ����
	public void getGoalList();	//��ǥ ���
	public void getRank();	//�޼��� ����
	public void readyUser();	//������ �غ� ����
	public void getReadyAll();	//��� ������� �غ� ���� ����
	public void startGoal();	//��ǥ ����
	public void getSquareList();	//������ ���� �ҷ�����
	public void changeSquare();	//�߰� ��ǥ �޼��� ���� �������� ���� ��ȭ
	public void getCurrentRank();	//���� ��ŷ �ҷ�����
}