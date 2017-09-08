package com.test.goal.controller;


import java.util.Map;

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
	@RequestMapping(value = "friend", method = RequestMethod.GET)
	public String friend(MyFriendVO fvo, Model model) {
		model.addAttribute("friend", dao.friend(fvo));
		return "/friend/friend";
	}
	
	// 친구 삭제
/*	@RequestMapping(value = "deleteFriend", method = RequestMethod.GET)
	public String deleteFriend(String frdid, RedirectAttributes rttr) {
		//rttr.addFlashAttribute("result", dao.deleteFriend(frdid));
		if(dao.deleteFriend(frdid) != 1) {
			rttr.addFlashAttribute("result", false);
		}
		rttr.addFlashAttribute("result", true);
		return "redirect:/friend/friend";
	}*/
	@RequestMapping(value = "deleteFriend", method = RequestMethod.POST)
	@ResponseBody
	public void deleteFriend(String frdid) {
		dao.deleteFriend1(frdid); // 내 입장
		dao.deleteFriend2(frdid); // 상대방 입장
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
