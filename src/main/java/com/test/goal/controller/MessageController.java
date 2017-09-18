package com.test.goal.controller;

import java.util.ArrayList;
import javax.servlet.http.HttpSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.test.goal.dao.MessageDAO;
import com.test.goal.vo.MessageVO;

@Controller
@RequestMapping("/message")
public class MessageController {
	
	@Autowired
	private MessageDAO dao;

	// 즉석에서 메시지 보내기
	@RequestMapping(value = {"writeMsg", "writeMsg2"}, method = RequestMethod.POST)
	@ResponseBody
	public boolean writeMsg(MessageVO vo, HttpSession session, RedirectAttributes attr) {
		String userid = (String) session.getAttribute("userid");
		
		//sender
		vo.setSender(userid);
		
		//title
		String msgTitle = vo.getMsgTitle();
		if (msgTitle == null) {
			vo.setMsgTitle("제목 없음");
		}
		
		//content
		String msgContent = vo.getMsgContent();
		String msgWithBr = msgContent.replace("\n", "<br>");	//엔터키 입력시 줄바꿈 처리
		vo.setMsgContent(msgWithBr);
		
		return dao.writeMsg(vo);
	}
	
	//나에게 메시지 보낸 사람 목록 불러오기(9/11 수정)
	@RequestMapping(value = "sendNReceiveList", method=RequestMethod.GET)
	public String sendNReceiveList(HttpSession session, Model model) {
		String userid = (String) session.getAttribute("userid");
		model.addAttribute("slist", dao.senderList(userid));
		//model.addAttribute("rlist", dao.receiverList(userid));
		return "/message/msgList";
	}
	
	//메시지 채팅 형식으로 출력(9/7 생성, 9/11 수정)
	@RequestMapping(value = "msgList", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<MessageVO> msgList(HttpSession session, String id, Model model) {
		String userid = (String) session.getAttribute("userid");
		return dao.msgList(userid, id);
	}
	
	//메시지 내용 읽기
	@RequestMapping(value = "readMsg", method = RequestMethod.GET)
	public String readMsg(int msgNum, Model model) {
		model.addAttribute("vo", dao.readMsg(msgNum));
		return "/message/readMsg";
	}
}
