package com.test.goal.controller;


import java.nio.file.Files;
import java.util.ArrayList;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.test.goal.dao.MemberDAO;
import com.test.goal.util.FileService;
import com.test.goal.util.Mail;
import com.test.goal.vo.BTMGoalVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MidGoalVO;
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
		System.out.println(vo);
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
		MemberVO result = dao.login(vo);
		if(result != null) {
			session.setAttribute("userid", vo.getUserid());
			
			//여기서부터 로직처리
			
			session.setAttribute("totalNum", "");
			session.setAttribute("clearNum", "");
			session.setAttribute("failNum", "");
			session.setAttribute("topGoalList", "");
			
			int totalNum = dao.getTotalNum((String)session.getAttribute("userid"));
			int clearNum = dao.getClearNum((String)session.getAttribute("userid"));
			int failNum = dao.getFailNum((String)session.getAttribute("userid"));
			
			ArrayList<MidGoalVO> topGoalList  = dao.getTopGoalList((String)session.getAttribute("userid"));
			
			session.setAttribute("totalNum", totalNum);
			session.setAttribute("clearNum", clearNum);
			session.setAttribute("failNum", failNum);
			session.setAttribute("topGoalList", topGoalList);
			
			
			return "redirect:/";
		}
		return "/member/login";
	}
	
	// ID 중복확인
	@RequestMapping(value = "idCheck", method = RequestMethod.POST)
	@ResponseBody
	public boolean idCheck(MemberVO vo) {
		if(dao.login(vo) == null) return false;
		return true;
	}
	
	// 이메일 중복확인
	@RequestMapping(value = "emailCheck", method = RequestMethod.POST)
	@ResponseBody
	public boolean emailCheck(MemberVO vo) {
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
	public String updateMemberForm(HttpSession session, Model model) {
		String userid=(String)session.getAttribute("userid");
		MemberVO vo = dao.memberList(userid);
		model.addAttribute("vo", vo); // 해당 user에 대한 정보
		return "/member/updateMember";
	}
	
	// 회원정보수정 기능
	@RequestMapping(value = "updateMember", method = RequestMethod.POST)
	public String updateMember(MemberVO vo, Model model, MultipartFile uploadFile) {
		//String userid = (String) session.getAttribute("userid");
		//String oldImage = vo.getImage();
		System.out.println("나와랏2:" +vo.toString());
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String image = FileService.saveFile(uploadFile);
			
			vo.setImage(image);
		}
		if(dao.updateMember(vo) != 1) {
			FileService.deleteFile(vo.getImage());
		}
		//if(!uploadFile.isEmpty()) FileService.deleteFile(oldImage);
		
		model.addAttribute("result", dao.updateMember(vo));
		//model.addAttribute("userid", userid);
		return "redirect:/";
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
	
	// ID, PWD 일치여부
	@RequestMapping(value = "idMatchUp", method = RequestMethod.GET)
	@ResponseBody
	public boolean idMatchUp(MemberVO vo) {
		if(dao.idMatchUp(vo) == null) return false;
		return true;
	}
	
	@RequestMapping(value = "getMGoalList", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<MidGoalVO> getMGoalList(int tGoalNum) {
		return dao.getMGoalList(tGoalNum);
	}
	
	@RequestMapping(value = "getBTMGoalList", method = RequestMethod.POST)
	@ResponseBody
	public ArrayList<BTMGoalVO> getBTMGoalList(int mGoalNum) {
		return dao.getBTMGoalList(mGoalNum);
	}
	
	
}
