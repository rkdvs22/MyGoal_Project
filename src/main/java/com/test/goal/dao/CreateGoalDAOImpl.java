package com.test.goal.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.BoardVO;
import com.test.goal.vo.FindHostVO;
import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.MemberListVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MidGoalVO;
import com.test.goal.vo.TopGoalVO;

@Repository
public class CreateGoalDAOImpl implements CreateGoalDAO {

	@Autowired
	private SqlSession sqlsession;
	
	// 목표 생성시 mainprogress 생성
	@Override
	public void create1(MainProgressVO mvo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		mapper.create1(mvo);
	}

	// 현재 progressNum의 데이터를 알기 위한 메서드
	@Override
	public MainProgressVO findProgressNum() {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.findProgressNum();
	}
	
	// 목표大작성
	@Override
	public int create2(TopGoalVO tvo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.create2(tvo);
	}

	// 멤버리스트 생성
	public void create3(MemberListVO mlvo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		mapper.create3(mlvo);
		//realWriteBoard(bvo);
	}
	
	// TopGoal 테이블의 현재 TopGoalNum 값을 받아온다.
	@Override
	public TopGoalVO findTGoalNum() {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.findTGoalNum();
	}
	
	// 목표大작성 기능에서 작성했던 내용들을 이용하여 Board 테이블에 값을 입력한다.
	@Override
	public void writeBoard(BoardVO bvo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		mapper.writeBoard(bvo);
	}
	

	@Override
	public TopGoalVO getInvitedProgress(int progressNum) {
		System.out.println("DAO : " + progressNum);
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.getInvitedProgress(progressNum);
	}

	
	
	
	
	
	
	
	
	
	

	/*
	// 목표大작성 전 MainProgress 테이블에 사용자가 작성한 값을 입력한다.
	@Override
	public MainProgressVO create2(MainProgressVO mvo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		mapper.create2(mvo);
		MainProgressVO new_mvo = new MainProgressVO();
		new_mvo = findProgressNum();
		return new_mvo;
	}
	*/
	
	public void realWriteBoard(BoardVO vo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		mapper.writeBoard(vo);
	}
	
	// 현재 게시글의 정보를 불러온다.
	@Override
	public BoardVO getBoardInfo() {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.getBoardInfo();
	}
	
	// modal 창 안에서 사용자의 ID를 검색한다
	@Override
	public ArrayList<MemberVO> findIdinModal(String keyWord) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.findIdinModal(keyWord);
	}

	// 목표 초대에 승인했을 경우 초대한 목표에 대한 정보를 찾는다.
	@Override
	public TopGoalVO findThatGoal(String senderId) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.findThatGoal(senderId);
	}

	// 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제하기 위해 현 게시글의 정보를 받아온다.
	@Override
	public BoardVO findCurrentBoard(String id) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.findCurrentBoard(id);
	}
	
	// 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제하기 위해 현재 MainProgress의 정보를 받아온다.
	@Override
	public MainProgressVO findCurrentTgoal(BoardVO vo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.findCurrentTgoal(vo);
	}
	
	// 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제한다.
	@Override
	public void exitCreateGoal(String id) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		BoardVO vo = findCurrentBoard(id);
		MainProgressVO mVO = findCurrentTgoal(vo);
		mapper.deleteCurrentBoard(id);
		mapper.deleteCurrentTgoal(vo);
		mapper.deleteCurrentMemberList(id);
		mapper.deleteCurrentMainProgress(mVO);
	}

	// TOPGOAL, MEMBERLIST 테이블에 사용자를 등록한 뒤 초대한 목표로 이동한다.
	@Override
	public ArrayList<MemberListVO> joinThatGoal(TopGoalVO vo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		int goalNum = mapper.findNewTgoalNum();
		vo.settGoalNum(goalNum);
		mapper.inputUserTgoal(vo);
		mapper.inputUserMemberList(vo);
		return mapper.getJoinUserList(vo);
	}

	// 작성한 중간목표를 입력한다.
	@Override
	public MidGoalVO inputMidGoal(MidGoalVO mvo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		mapper.inputMidGoal(mvo);
		return selectNowMidGoal(mvo);
	}
	
	// 현재 작성한 중간목표를 불러온다.
	@Override
	public MidGoalVO selectNowMidGoal(MidGoalVO mvo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.selectNowMidGoal(mvo);
	}

	// 작성한 세부목표들을 입력한다.
	@Override
	public void inputBtmGoal(BTMGoalVO vo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		mapper.inputBtmGoal(vo);
	}

	// 해당하는 방의 HOST 아이디를 불러온다.
	@Override
	public String findThisGoalHost(FindHostVO host_vo) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		int newTgoalNum = mapper.findMyTgoalNum(host_vo.getMyId());
		host_vo.settGoalNum(newTgoalNum);
		return mapper.findThisGoalHost(host_vo);
	}

	// 사용자가 선택한 색상의 hex값을 테이블에 갱신한다.
	@Override
	public int updateColor(Map<String, String> map) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.updateColor(map);
	}

	// 준비를 누른 사람이 이전에 레디를 했는지에 대한 여부를 불러온다.
	@Override
	public String getReadyFlag(Map<String, String> map) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		int progressNum = mapper.getProgressNum(Integer.parseInt(map.get("tGoalNum").toString()));
		map.put("progressNum", String.valueOf(progressNum));
		return mapper.getReadyFlag(map);
	}

	// GoalTree에서 목표를 선택할 시 그에 맞는 마방진으로 이동한다.
	@Override
	public Map<String, Object> treeToGoal(int goalNum) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		BoardVO board_vo = mapper.getBoardFromTree(goalNum);
		System.out.println(board_vo);
		int progressNum = mapper.getProgressNum(goalNum);
		ArrayList<TopGoalVO> tGoal_list = mapper.getTopGoalFromTree(progressNum);
		MainProgressVO progress_vo = mapper.getMainProgress(progressNum);
		ArrayList<MemberListVO> member_list = mapper.getMemberList(progressNum);
		
		Map<String, Object> map = new HashMap<>();
		map.put("b_info", board_vo);
		map.put("tGoal_list", tGoal_list);
		map.put("progress_info", progress_vo);
		map.put("member_list", member_list);
		return map;
	}

	// 유저들의 색상지정 여부와 레디 여부를 불러온다.
	@Override
	public ArrayList<MemberListVO> checkUsers(int progressNum) {
		CreateGoalMapper mapper = sqlsession.getMapper(CreateGoalMapper.class);
		return mapper.checkUsers(progressNum);
	}

}
