package com.test.goal.controller;

import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import com.test.goal.dao.FriendDAO;
import com.test.goal.dao.MessageDAO;
import com.test.goal.vo.MessageVO;
import com.test.goal.vo.MyFriendVO;

@Controller
@RequestMapping("/friend")
public class FriendController {
	
	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	private FriendDAO dao;
	
	@Autowired
	private MessageDAO mdao;
	
	// 친구목록
	@RequestMapping(value = "openFriend", method = RequestMethod.GET)
	public String openFriend(MyFriendVO fvo, Model model) {
		model.addAttribute("friend", dao.openFriend(fvo));
		return "/friend/friend";
	}
	//친구삭제
	@RequestMapping(value = "deleteFriend", method = RequestMethod.POST)
	@ResponseBody
	public void deleteFriend(String frd,HttpServletRequest request) {
		String sessionId = (String) request.getSession().getAttribute("userid");
		MyFriendVO MyFriendDelete = new MyFriendVO();
		MyFriendDelete.setUserid(sessionId);
		MyFriendDelete.setFrdid(frd);
		
		dao.deleteFriend1(MyFriendDelete); // 내 입장
		dao.deleteFriend2(MyFriendDelete); // 상대방 입장
	}
	
	// 친구 메시지
	@RequestMapping(value = "friendMessage", method = RequestMethod.GET)
	public String friendMessage(String frdid, Model model) {
		model.addAttribute("frdid", frdid);
		return "/friend/friendMessage";
	}
	
	// 친구검색 화면이동
	@RequestMapping(value = "searchFriendForm", method = RequestMethod.GET)
	public String searchFriendForm() {
		return "/friend/searchFriend";
	}
	
	// 친구검색
	@RequestMapping(value = "searchFriend", method = RequestMethod.POST)
	public String searchFriend(@RequestParam(value = "searchKeyid", defaultValue = "1") String searchKeyid,
			Map<String, String> map, Model model, HttpSession session) {
		String userid = (String)session.getAttribute("userid");
		map.put("searchKeyid", searchKeyid);
		map.put("userid", userid);
		
		model.addAttribute("searchKeyid", searchKeyid);
		model.addAttribute("searchList", dao.searchFriend(map));
		return "/friend/searchFriend";
	}
	
	//친구 신청 버튼 클릭시
	@RequestMapping(value = "applyFriend", method = RequestMethod.POST)
	@ResponseBody
	public boolean applyFriend(HttpSession session, Model model, String frdid) {
		String userid = (String) session.getAttribute("userid");
		
		if (dao.isFriend(userid, frdid) == null) return true;
		else return false;
	}
	
	//친구 신청 메시지 폼으로 이동
	@RequestMapping(value = "applyFriendForm", method = RequestMethod.GET)
	public String applyFriendForm(String frdid, Model model) {
		model.addAttribute("frdid", frdid);
		return "/friend/applyFriendForm";
	}
	
	//친구 신청 메시지 전송
	@RequestMapping(value = "applyMsg", method = RequestMethod.POST)
	@ResponseBody
	public boolean applyMsg(MessageVO vo, Model model, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		
		//sender
		vo.setSender(userid);
		
		//content
		String msgContent = vo.getMsgContent();
		String msgWithBr = msgContent.replace("\n", "<br>");	//엔터키 입력시 줄바꿈 처리

		vo.setMsgContent(msgWithBr);
		
		return mdao.writeMsg(vo);
	}
	
	// 친구등록
	@RequestMapping(value = "addFriend", method = RequestMethod.POST)
	@ResponseBody
	public void addFriend(String frdid, HttpSession session) {
		String userid = (String) session.getAttribute("userid");
		dao.addFriend(userid, frdid);
		dao.addFriend(frdid, userid);
	}
}
