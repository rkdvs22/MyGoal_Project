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

import com.test.goal.dao.MemberDAO;
import com.test.goal.util.FileService;
import com.test.goal.util.Mail;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MyFriendVO;

@Controller
@RequestMapping("/member")
public class MemberController {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);
	
	@Autowired
	private MemberDAO dao;
	
	// 회원가입 화면전환
	@RequestMapping(value = "joinForm", method = RequestMethod.GET)
	public String joinForm() {
		return "/member/join";
	}
	
	// 회원가입 기능
	@RequestMapping(value = "join", method = RequestMethod.POST)
	public String join(MemberVO vo, MultipartFile uploadFile) {
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String image = FileService.saveFile(uploadFile);
			
			vo.setImage(image);
			dao.join(vo);
		}
		return "redirect:/";
	}
	
	// 로그인 화면전환 
	@RequestMapping(value = "loginForm", method = RequestMethod.GET)
	public String loginForm() {
		return "/member/login";
	}
	
	// 로그인 기능
	@RequestMapping(value = "login", method = RequestMethod.POST)
	public String login(MemberVO vo, HttpSession session) {
		if(dao.login(vo) != null) {
			session.setAttribute("userid", vo.getUserid());
			return "redirect:/";
		}
		return "/member/login";
	}
	
	// 중복확인
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	@ResponseBody
	public boolean idCheck(MemberVO vo) {
		if(dao.login(vo) == null) return false;
		return true;
	}
	
	// 로그아웃 기능
	@RequestMapping(value = "logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	// 회원정보수정 화면전환
	@RequestMapping(value = "updateMemberForm", method = RequestMethod.GET)
	public String updateMemberForm(String userid, Model model) {
		model.addAttribute("vo", dao.memberList(userid));
		return "/member/updateMember";
	}
	
	// 회원정보수정 기능
	@RequestMapping(value = "updateMember", method = RequestMethod.POST)
	public String updateMember(MemberVO vo, Model model, MultipartFile uploadFile) {
		model.addAttribute("result", dao.updateMember(vo));
		model.addAttribute("userid", vo.getUserid());
		
		String oldImage = memberList(vo.getUserid());/*.getImage();*/
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String image = FileService.saveFile(uploadFile);
			
			vo.setImage(image);
		} if(dao.updateMember(vo) != 1) {
			FileService.deleteFile(vo.getImage());
		} if(!uploadFile.isEmpty()) FileService.deleteFile(oldImage);
		
		return "forward:/member/updateMember";
	}
	
	// 회원목록
	@RequestMapping(value = "memberList", method = RequestMethod.GET)
	private String memberList(String userid) {
			//model.addAttribute("memberList", dao.memberList());
		dao.memberList(userid);
		return "redirect:/";
	}

	// ID/PWD 찾기 화면전환 
	@RequestMapping(value = "findForm", method = RequestMethod.GET)
	public String findForm() {
		return "/member/find";
	}
	
	// ID/PWD 찾기 메일전송 기능
	@RequestMapping(value = "find", method = RequestMethod.POST)
	public String find(String email, RedirectAttributes rttr) {
		
		MemberVO vo = dao.find(email);
		
		if(vo != null) {
			Mail.sendMail(vo);
			rttr.addFlashAttribute("result", true);
		}
		
		rttr.addFlashAttribute("result", false);
		return "/member/find";
	}
	
	// 친구목록
	@RequestMapping(value = "friend", method = RequestMethod.GET)
	public String friend(MyFriendVO fvo, Model model) {
		model.addAttribute("friend", dao.friend(fvo));
		return "/member/friend";
	}
	
	// 친구 삭제
/*	@RequestMapping(value = "deleteFriend", method = RequestMethod.GET)
	public String deleteFriend(String frdid, RedirectAttributes rttr) {
		//rttr.addFlashAttribute("result", dao.deleteFriend(frdid));
		if(dao.deleteFriend(frdid) != 1) {
			rttr.addFlashAttribute("result", false);
		}
		rttr.addFlashAttribute("result", true);
		return "redirect:/member/friend";
	}*/
	@RequestMapping(value = "deleteFriend", method = RequestMethod.POST)
	@ResponseBody
	public void deleteFriend(String frdid) {
		dao.deleteFriend(frdid);
	}
	
	// 친구검색
	@RequestMapping(value = "searchFriend", method = RequestMethod.GET)
	public String searchFriend(@RequestParam(value = "searchKeyid", defaultValue = "1") String searchKeyid,
			Map<String, String> map, Model model) {
		map.put("searchKeyid", searchKeyid);
		
		model.addAttribute("searchFriend", dao.searchFriend(map));
		model.addAttribute("searchKeyid", searchKeyid);
		return "/member/searchFriend";
	}
	
	
	
	
}
