package com.test.goal.controller;

import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.goal.dao.CreateGoalDAO;
import com.test.goal.dao.FriendDAO;
import com.test.goal.dao.MessageDAO;
import com.test.goal.vo.MainProgressVO;
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
	public String create(TopGoalVO tvo, MainProgressVO mvo, Model model) {
		/*map.put("create1", dao.create1(tvo));
		map.put("create2", dao.create2(mvo));
		rttr.addFlashAttribute("createGoal", map);*/
		
		/*rttr.addFlashAttribute("topGoal", dao.create1(tvo));
		rttr.addFlashAttribute("mainProgress", dao.create2(mvo));*/
		
		model.addAttribute("topGoal", dao.create1(tvo));
		model.addAttribute("mainProgress", dao.create2(mvo));
		return "redirect:/";
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
			msgVO.setMsgTitle("[SYSTEM] : " + myId + "님께서" + friendId + "님을 초대하셨습니다");
			msgVO.setMsgContent("다음의 목표에 참가하시겠습니까?");
			// 목표에 대한 정보를 view단에서 보여줄 예정. 중간 세이브
			boolean result = msg_dao.writeMsg(msgVO);
			if(result) result_count++;
		}
		
		if(nameList.length == result_count) return true;
		else return false;
	}
}