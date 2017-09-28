package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;

import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MemberListVO;
import com.test.goal.vo.TopGoalVO;

public interface BoardMapper {

	public ArrayList<BoardVO> boardList(Map<String, String> map, RowBounds rb); // 게시글 목록, 검색, 페이징

	public int getTotal(Map<String, String> map); // 페이징 : 전체 게시글 수 가져오기

	public void addFavorite(int boardnum); // 좋아요

	public BoardVO getTopGoalNum(String userid); // Board 테이블에서 가장 최신화된 tGoalNum, userid을 가져옴
	
	public TopGoalVO getGoalProgressNum(BoardVO bvo); // TopGoal 테이블에서 tGoalNum을 이용 progressNum 가져옴
	
	public MemberListVO getMemberProgressNum(TopGoalVO tvo); // TopGoal 테이블의 progressNum을 이용하여 MemberList 테이블의 progressNum 가져옴

	public MemberListVO inputMemberList(MemberListVO lvo); // MemberList 테이블에 user에 대한 데이터 입력

	public TopGoalVO inputTopGoal(TopGoalVO tvo); // TopGoal 테이블에 user에 대한 데이터 입력

	public TopGoalVO getProgressNum(TopGoalVO vo);

}
