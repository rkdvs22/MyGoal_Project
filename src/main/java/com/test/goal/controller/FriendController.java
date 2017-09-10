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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.goal.dao.FriendDAO;
import com.test.goal.dao.MemberDAO;
import com.test.goal.util.FileService;
import com.test.goal.util.Mail;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MyFriendVO;

@Controller
@RequestMapping("/friend")
public class FriendController {
	
	private static final Logger logger = LoggerFactory.getLogger(FriendController.class);
	
	@Autowired
	private FriendDAO dao;
	
	
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
	
	// 친구검색 화면이동
	@RequestMapping(value = "searchFriendForm", method = RequestMethod.GET)
	public String searchFriendForm() {
		return "/friend/searchFriend";
	}
	
	// 친구검색
	@RequestMapping(value = "searchFriend", method = RequestMethod.GET)
	public String searchFriend(@RequestParam(value = "searchKeyid", defaultValue = "1") String searchKeyid,
			Map<String, String> map, Model model) {
		map.put("searchKeyid", searchKeyid);

		model.addAttribute("searchFriend", dao.searchFriend(map));
		model.addAttribute("searchKeyid", searchKeyid);
		return "/friend/searchFriend";
	}
	
	
	
	
}
