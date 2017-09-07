package com.test.goal.dao;

public interface SquareDAO {
	public void createGoal();	//최상위 목표 생성
	public void updateGoalTheme();	//최상위 목표 내 중간 목표 정보 수정
	public void getGoalList();	//목표 출력
	public void getRank();	//달성률 순위
	public void readyUser();	//본인의 준비 상태
	public void getReadyAll();	//모든 사용자의 준비 상태 여부
	public void startGoal();	//목표 시작
	public void getSquareList();	//마방진 상태 불러오기
	public void changeSquare();	//중간 목표 달성에 따른 마방진의 상태 변화
	public void getCurrentRank();	//현재 랭킹 불러오기
}