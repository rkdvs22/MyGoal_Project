package com.test.goal.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.goal.dao.CreateGoalDAO;
import com.test.goal.dao.FriendDAO;
import com.test.goal.dao.MessageDAO;
import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MessageVO;
import com.test.goal.vo.MyFriendVO;
import com.test.goal.vo.TopGoalVO;

@Controller
@RequestMapping("/createGoal")
public class CreateGoalController {

	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private CreateGoalDAO dao;
	@Autowired
	private FriendDAO friend_dao;
	@Autowired
	private MessageDAO msg_dao;
	
	
	
	// 마방진 생성화면으로 이동
	@RequestMapping(value = "MGoalSquareForm", method = RequestMethod.GET)
	public String MGoalSquareForm(HttpSession session) {
		String hostId = (String)session.getAttribute("userid");
		session.setAttribute("hostId", hostId);
		return "/createGoal/MGoalSquareForm";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 목표大작성화면 이동
	@RequestMapping(value = "createForm", method = RequestMethod.GET)
	public String createForm() {
		return "/createGoal/create";
	}
	
	

	
	
	// 목표大작성 기능
	@RequestMapping(value = "create", method = RequestMethod.POST)
	public String create(TopGoalVO tvo, MainProgressVO mvo, Model model, int progressNum, HttpSession session) {
		mvo.setProgressNum(progressNum);
		model.addAttribute("topGoal", dao.create1(tvo));
		int topGoalNum = dao.getTgoalNum().gettGoalNum();
		tvo.settGoalNum(topGoalNum);
		writeBoard(tvo);
		model.addAttribute("b_info", dao.getBoardInfo());
		System.out.println("[BOARD INFO] : " + dao.getBoardInfo());
		return "/createGoal/MGoalSquareForm";
	}
	
	// 목표大작성 전 MainProgress 테이블에 사용자가 작성한 값을 입력한다.
	@RequestMapping(value = "create2", method = RequestMethod.POST)
	@ResponseBody
	public MainProgressVO create2(MainProgressVO mvo, Model model) {
		MainProgressVO result_vo = dao.create2(mvo);
		return result_vo;
	}
	
	// 목표大작성 기능에서 작성했던 내용들을 이용하여 Board 테이블에 값을 입력한다.
	public void writeBoard(TopGoalVO tvo) {
		
		BoardVO vo = new BoardVO();
		vo.settGoalNum(tvo.gettGoalNum());
		vo.setUserid(tvo.getUserid());
		dao.writeBoard(vo);
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 친구초대를 위한 친구목록 불러오기
	@RequestMapping(value = "getFriendList", method = RequestMethod.GET)
	@ResponseBody
	public ArrayList<MyFriendVO> getFriendList(HttpSession session, MyFriendVO fvo) {
		String myId = (String) session.getAttribute("userid");
		fvo.setUserid(myId);
		ArrayList<MyFriendVO> friendList = friend_dao.openFriend(fvo);
		return friendList;
	}
	
	// 선택한 친구들에게 초대장 보내기
	@RequestMapping(value = "writeInviteMsg", method = RequestMethod.POST)
	@ResponseBody
	public boolean writeInviteMsg(HttpSession session
								, String[] nameList
								, MessageVO msgVO) {
		
		int result_count = 0;
		
		String myId = (String) session.getAttribute("userid");
		
		for(int i=0; i<nameList.length; i++) {
			String friendId = nameList[i];
			msgVO.setSender(myId);
			msgVO.setReceiver(friendId);
			msgVO.setMsgTitle("[SYSTEM] " + myId + "님께서 " + friendId + "님을 초대 하셨습니다 ");
			msgVO.setMsgContent("초대하신 목표에 참가하시겠습니까?");
			// 목표에 대한 정보를 view단에서 보여줄 예정. 중간 세이브
			boolean result = msg_dao.writeMsg(msgVO);
			if(result) result_count++;
		}
		
		if(nameList.length == result_count) return true;
		else return false;
	}
	
	// 초대 화면에서 초대하고 싶은 사용자의 ID를 검색한다.
	@RequestMapping(value = "findIdinModal", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<MemberVO> findIdinModal(String keyWord) {
		ArrayList<MemberVO> list = dao.findIdinModal(keyWord);
		return list;
	}
	
	// 목표 초대에 승인했을 경우 초대한 게시글에 대한 정보를 찾는다.
	@RequestMapping(value = "findThatGoal", method = RequestMethod.POST)
	@ResponseBody
	public BoardVO findThatGoal(String senderId) {
		BoardVO vo = dao.findThatGoal(senderId);
		return vo;
	}
	
	// 초대한 목표로 이동한다.
	@RequestMapping(value = "joinThatGoal", method = RequestMethod.GET)
	public String joinThatGoal(int boardNum, int progressNum, String id) {
		// mainprogress 테이블의 progressNum을 이용해 MEMBERLIST 테이블에 사용자의 ID를 추가한다.
		// =================== 09.19 Save ====================
		return "";
	}
	
	// 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제한다.
	@RequestMapping(value = "exitCreateGoal", method = RequestMethod.POST)
	@ResponseBody
	public void exitCreateGoal(String id) {
		dao.exitCreateGoal(id);
	}
}