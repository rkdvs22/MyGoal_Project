package com.test.goal.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.javassist.compiler.ast.NewExpr;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.test.goal.dao.CreateGoalDAO;
import com.test.goal.dao.FriendDAO;
import com.test.goal.dao.GoalTreeDAO;
import com.test.goal.dao.MessageDAO;
import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.BoardVO;
import com.test.goal.vo.FindHostVO;
import com.test.goal.vo.MainProgressVO;
import com.test.goal.vo.MemberListVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MessageVO;
import com.test.goal.vo.MidGoalVO;
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
	private MessageDAO mdao;
	@Autowired
	private GoalTreeDAO gdao;
	@Autowired
	
	// 목표大작성화면 이동
	@RequestMapping(value = "createForm", method = RequestMethod.GET)
	public String createForm() {
		return "/createGoal/create";
	}
	
	//목표 생성 후 마방진으로 이동
	@RequestMapping(value = "createSquare", method = RequestMethod.POST)
	public String create2(MainProgressVO mvo, TopGoalVO tvo, BoardVO bvo, Model model) {
		mvo.setMaxMember(Integer.parseInt(tvo.getMaxMemberS())); //인원수 타입 변환
		dao.create1(mvo); //mainprogress 생성
		mvo = dao.findProgressNum(); //생성된 mainprogress 불러오기
		
		String userid = tvo.getUserid(); // 생성한 사람의 아이디 불러오기
		int progressSeq = mvo.getProgressNum(); //생성된 mainprogress의 시퀀스 불러오기
		
		tvo.setProgressNum(progressSeq); //mainprogress 시퀀스를 TopGoal의 매개변수로 넘김
		dao.create2(tvo); //topGoal 생성
		tvo = dao.findTGoalNum(); //생성된 topGoal 불러오기
		
		MemberListVO mlvo = new MemberListVO();
		mlvo.setProgressNum(progressSeq);
		mlvo.setUserid(userid);
		dao.create3(mlvo); //memberList 생성
		
		int tGoalNum = tvo.gettGoalNum();
		bvo.settGoalNum(tGoalNum);
		bvo.setProgressNum(progressSeq);
		dao.writeBoard(bvo); //board 생성
		
		System.out.println(mvo.toString());
		System.out.println(tvo.toString());
		System.out.println(mlvo.toString());
		System.out.println(bvo.toString());
		
		ArrayList<MemberListVO> memberList = gdao.memberList(tGoalNum);
		
		model.addAttribute("mainProgress", mvo); //mainProgress
		model.addAttribute("currentMembers", memberList.size()); //현재 인원수
		model.addAttribute("topGoal", gdao.topGoalList(tGoalNum));
		model.addAttribute("memberList", memberList);
		
		return "/createGoal/MGoalSquareForm2";
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

	//초대 메시지 전송
	@RequestMapping(value = "writeInviteMsg", method = RequestMethod.GET)
	@ResponseBody
	public boolean writeInviteMsg(String[] nameList, int progressNum, HttpSession session) {
		System.out.println("CON : " + progressNum);
		
		MessageVO mvo = new MessageVO();
		String userid = (String) session.getAttribute("userid");
		TopGoalVO tvo = dao.getInvitedProgress(progressNum); //초대하려는 목표 정보
		String str = "<input type='hidden' id='progressNum' name='" + progressNum + "' value=" + progressNum + ">";
		
		System.out.println("pnum:" + progressNum);
		System.out.println("tgoal:" + tvo.toString());
		
		//sender
		mvo.setSender(userid);
		
		//title
		mvo.setMsgTitle("[SYSTEM] 목표 달성 프로그램 초대장이 도착하였습니다.");
		
		//content
		mvo.setMsgContent(userid + "님이 <" + tvo.gettGoalTitle() + "> 프로그램에 초대하셨습니다.<br>목표에 참가하시겠습니까?/" + str);

		//receiver : 콤마(,)를 기준으로 복수의 수신자 구분
		for (int i = 0; i < nameList.length; i++) {
			mvo.setReceiver(nameList[i]);
			mdao.writeMsg(mvo);
		}
		
		return true;
	}
	
	
	
	//초대 승인 시 마방진으로 이동
	
	
	
	/*
	// 목표大작성 기능
	@RequestMapping(value = "createNewGoal", method = RequestMethod.POST)
	public String create(TopGoalVO tvo, Model model, HttpSession session) {
		
//		if(tvo.getProgressNumS() != null){
			MainProgressVO m = new MainProgressVO();
			m.setMaxMember(Integer.parseInt(tvo.getMaxMemberS()));
			m.setProgressNum(0);
			m.setType(tvo.getType());
			m.setmStart("N");
			
			MainProgressVO result_vo = dao.create2(m);
			tvo.setProgressNum(result_vo.getProgressNum());
			
			String hostId = (String)session.getAttribute("userid");
			session.setAttribute("hostId", hostId);
			int topGoalNum = dao.getTgoalNum().gettGoalNum();
			tvo.settGoalNum(topGoalNum);
			
			
			writeBoard(tvo);
			int createKey = 1;
			model.addAttribute("createKey", createKey);
			model.addAttribute("hostId", hostId);
			model.addAttribute("b_info", dao.getBoardInfo());
//		}
		return "/createGoal/MGoalSquareForm";
	}
	*/
	/*
	// 목표大작성 전 MainProgress 테이블에 사용자가 작성한 값을 입력한다.
	@RequestMapping(value = "create2", method = RequestMethod.POST)
	@ResponseBody
	public MainProgressVO create2(MainProgressVO mvo, Model model) {
		MainProgressVO result_vo = dao.create2(mvo);
		dao.create1(tvo);
		
		model.addAttribute("topGoal", create1);	//topGoal 생성
		
		return result_vo;
	}
	*/
	
	/*
	// 목표大작성 기능에서 작성했던 내용들을 이용하여 Board 테이블에 값을 입력한다.
	public void writeBoard(TopGoalVO tvo) {
		
		BoardVO vo = new BoardVO();
		vo.settGoalNum(tvo.gettGoalNum());
		vo.setUserid(tvo.getUserid());
		dao.writeBoard(vo);
	}
	*/
	
	/*
	@RequestMapping(value = "openGoalSquare", method = RequestMethod.GET)
	public String openGoalSquar() {
		return "/createGoal/goalSquare";
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
	
	// 목표 초대에 승인했을 경우 초대한 목표에 대한 정보를 찾는다.
	@RequestMapping(value = "findThatGoal", method = RequestMethod.POST)
	@ResponseBody
	public TopGoalVO findThatGoal(String senderId) {
		TopGoalVO vo = dao.findThatGoal(senderId);
		return vo;
	}
	
	// 초대한 목표로 이동한다.
	@RequestMapping(value = "joinThatGoal")
	public String joinThatGoal(String id, Model model, HttpSession session) {
		TopGoalVO vo = findThatGoal(id);
		String invitedId = (String) session.getAttribute("userid");
		vo.setUserid(invitedId);
		String[] sDate_temp = vo.gettStartDate().split(" ");
		String[] eDate_temp = vo.gettEndDate().split(" ");
		String[] sDate = sDate_temp[0].split("-");
		String[] eDate = eDate_temp[0].split("-");
		vo.settStartDate(sDate[0] + "/" + sDate[1] + "/" + sDate[2]);
		vo.settEndDate(eDate[0] + "/" + eDate[1] + "/" + eDate[2]);
		
		model.addAttribute("newUser", dao.joinThatGoal(vo));
		model.addAttribute("b_info", dao.getBoardInfo());
		FindHostVO host_vo = new FindHostVO();
		host_vo.setMyId(invitedId);
//		model.addAttribute("host", dao.findThisGoalHost(host_vo));
		
		return "/createGoal/MGoalSquareForm";
	}
	
	// 목표를 만든 사용자가 나가기 버튼을 클릭했을 경우 관련된 데이터를 삭제한다.
	@RequestMapping(value = "exitCreateGoal", method = RequestMethod.POST)
	@ResponseBody
	public void exitCreateGoal(String id) {
		dao.exitCreateGoal(id);
	}
	
	// HOST가 중간목표 및 그에 따른 세부목표를 입력하는 메서드이다.
	@SuppressWarnings("unchecked")
	@RequestMapping(value = "inputGoal", method = RequestMethod.POST 
			, produces = "application/json;charset=UTF-8")
	@ResponseBody
	public boolean inputGoal(@RequestBody Map<String, Object> map
						, MidGoalVO mvo) {
		
		// 중간목표
		String mGoal = ( (HashMap<Object, Object>) ( (HashMap<Object, Object>)
						map.get("midGoal") ).get("key1") ).get("mGoal").toString();
		String m_sDate = ( (HashMap<Object, Object>) ( (HashMap<Object, Object>)
						map.get("midGoal") ).get("key1") ).get("sDate").toString();
		String m_eDate = ( (HashMap<Object, Object>) ( (HashMap<Object, Object>)
						map.get("midGoal") ).get("key1") ).get("eDate").toString();
		String tGoalNum = map.get("tGoalNum").toString();
		
		mvo.setmGoalTitle(mGoal);
		String[] m_sDateSp = m_sDate.split("-");
		String[] m_eDateSp = m_eDate.split("-");
		mvo.setmStartDate(m_sDateSp[0] + "/" + m_sDateSp[1] + "/" + m_sDateSp[2]);
		mvo.setmEndDate(m_eDateSp[0] + "/" + m_eDateSp[1] + "/" + m_eDateSp[2]);
		mvo.settGoalNum(Integer.parseInt(tGoalNum));
		
		dao.inputMidGoal(mvo);
		
		// 세부목표
		MidGoalVO current_vo = dao.selectNowMidGoal(mvo);
		for(int i=0; i<Integer.parseInt(map.get("goalCount").toString()); i++) {
			String bGoal = ( (HashMap<Object, Object>) ( (ArrayList<Object>)
							( (HashMap<Object, Object>)map.get("btmGoal") ).get("key2")).get(i)).get("bGoal").toString();
			String bGoalDay = ( (HashMap<Object, Object>) ( (ArrayList<Object>)
							( (HashMap<Object, Object>)map.get("btmGoal") ).get("key2")).get(i)).get("bGoalDay").toString();
			String[] bGoalDaySp = bGoalDay.split("-");
			
			BTMGoalVO bvo_temp = new BTMGoalVO();
			bvo_temp.setbGoalTitle(bGoal);
			bvo_temp.setPeriod(Integer.parseInt(bGoalDaySp[2]));
			bvo_temp.setmGoalNum(current_vo.getmGoalNum());
			dao.inputBtmGoal(bvo_temp);
		}
		
		return true;
	}
	
	// 사용자가 선택한 색상의 hex값을 테이블에 갱신한다.
	@RequestMapping(value = "updateColor", method = RequestMethod.POST)
	@ResponseBody
	public void updateColor(@RequestBody Map<String, String> map) {
		dao.updateColor(map);
	}
	
	// 준비를 누른 사람이 이전에 레디를 했는지에 대한 여부를 불러온다.
	@RequestMapping(value = "getReadyFlag", method = RequestMethod.POST)
	@ResponseBody
	public boolean getReadyFlag(@RequestBody Map<String, String> map) {
		String ready_result = dao.getReadyFlag(map);
		if(ready_result.equals("Y")) return true;
		else return false;
	}
	
	// 준비하지 않았을 경우 준비, 한 상태일 경우 취소
	@RequestMapping(value = "switchReady", method = RequestMethod.POST)
	@ResponseBody
	public void switchReady(@RequestBody Map<String, String> map) {
//		System.out.println(map);
	}
	
	// 준비를 누른 사람이 이전에 레디를 했는지에 대한 여부를 불러온다.
	@RequestMapping(value = "startGoal", method = RequestMethod.GET)
	public String startGoal(int sectionNum, String[] id_list, int progressNum, Model model) {
		
		HashMap<String, Integer> map = new HashMap<>();
		
		for(int i=0; i<id_list.length; i++) {
			map.put(id_list[i], sectionNum);
		}
		
		model.addAttribute("sectionNum", sectionNum);
		model.addAttribute("mGoalNumList", map);
		model.addAttribute("progressNum", progressNum);
		
		return "/mind/mindMap";
	}
	
	
	// 유저들의 색상지정 여부와 레디 여부를 불러온다.
	@RequestMapping(value = "checkUsers", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<MemberListVO> checkUsers(int progressNum) {
		ArrayList<MemberListVO> list = dao.checkUsers(progressNum);
//		for(MemberListVO vo:list) {
//			System.out.println(vo);
//		}
		return list;
	}
	
	
	@RequestMapping(value = "getMemberList", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<MemberListVO> getMemberList(String id) {
		
		TopGoalVO vo = findThatGoal(id);
		String[] sDate_temp = vo.gettStartDate().split(" ");
		String[] eDate_temp = vo.gettEndDate().split(" ");
		String[] sDate = sDate_temp[0].split("-");
		String[] eDate = eDate_temp[0].split("-");
		vo.settStartDate(sDate[0] + "/" + sDate[1] + "/" + sDate[2]);
		vo.settEndDate(eDate[0] + "/" + eDate[1] + "/" + eDate[2]);
		
		ArrayList<MemberListVO> list = dao.joinThatGoal(vo);
//		HashSet hs = new HashSet<>(temp);
//		ArrayList<MemberListVO> list = new ArrayList<>(hs);
		
//		for(MemberListVO m:list) {
//			System.out.println(m);
//		}
		
		return list;
	}
	
	// 유저들의 색상지정 여부와 레디 여부를 불러온다.
	@RequestMapping(value = "MidGoalForm1", method = RequestMethod.GET)
	public String checkUsers() {
		return "/createGoal/MidGoalForm1";
	}
	*/
}