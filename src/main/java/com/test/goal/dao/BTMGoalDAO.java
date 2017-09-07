package com.test.goal.dao;

public interface BTMGoalDAO {
	public void getBTMGoalList();	//���� ��ǥ ��� ��������
	public void randomAllocate();	//���� ���� ��ġ
	
	public void insertBTMRecord();	//���� ��ǥ�� ���� ��� ���
	public void updateBTMRecord();	//���� ��� ����
	public void ranking();	//���� ����� 1�� ���
	public void takeCalendar();	//�޷� �������� �̵�
	public void insertPeriodCalendar();	//�޷¿� �Ⱓ �� ���� �Է�
	
	public void insertDayRecord();	//���� ��� �Է�
	public void updateDayRecord();	//���� ��� ����
	public void finishDayRecord();	//���� �ڵ� ����
	public void insertDRCalandar();	//�޷¿� ���� ��� �Է�
	
}
