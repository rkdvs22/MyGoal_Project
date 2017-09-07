package com.test.goal.controller;

import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.test.goal.dao.MessageDAO;
import com.test.goal.vo.MessageVO;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageDAO dao;

	// 메시지 보내기
	@RequestMapping(value = "writeMsg", method = RequestMethod.POST)
	public String writeMsg(MessageVO vo, HttpSession session, RedirectAttributes attr) {
		//임시로그인
		session.setAttribute("userid", "SCITMASTER");
		String userid = (String) session.getAttribute("userid");
		vo.setSender(userid);
		
		attr.addFlashAttribute("result", dao.writeMsg(vo));
		System.out.println(vo.toString());
		return "redirect:/message/msgList";
	}
	/*
	// 받은 메시지 목록 불러오기
	@RequestMapping(value = "receivedMsgList", method = RequestMethod.GET)
	public String receivedMsgList(HttpSession session, Model model) {
		//임시로 입력한 부분
		session.setAttribute("userid", "SCITMASTER");
		String userid = (String) session.getAttribute("userid");
		//여기까지는 임시로 입력한 부분
		model.addAttribute("list", dao.receivedMsgList(userid));
		//model.addAttribute("vo", dao.readMsg(msgNum));
		return "/message/receivedMsgList";
	}
	
	//보낸 메시지 목록 불러오기
	@RequestMapping(value = "sentMsgList", method = RequestMethod.GET)
	public String sentMsgList(HttpSession session, Model model) {
		
		return "/message/sentMsgList";
	}
	*/
	
	/*
	//메시지 창으로 이동
	@RequestMapping(value = "getMsg", method=RequestMethod.GET)
	public String getMsg() {
		return "/message/msgList";
	}
	*/
	
	//메시지 창에서 친구 목록 불러오기
	@RequestMapping(value = "friendList", method=RequestMethod.GET)
	public String friendList(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		model.addAttribute("friendList", dao.friendList(userid));
		return "/message/msgList";
	}
	
	//메시지 채팅 형식으로 출력(9/7 생성)
	@RequestMapping(value = "msgList", method = RequestMethod.GET)
	public String msgList(HttpSession session, String friend, Model model) {
		String userid = (String) session.getAttribute("userid");
		model.addAttribute("msgList", dao.msgList(userid, friend));
		return "redirect:/message/msgList";
	}
	
	//메시지 내용 읽기
	@RequestMapping(value = "readMsg", method = RequestMethod.GET)
	public String readMsg(int msgNum, Model model) {
		model.addAttribute("vo", dao.readMsg(msgNum));
		return "/message/readMsg";
	}
}
