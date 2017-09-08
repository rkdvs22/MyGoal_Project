package com.test.goal.dao;

import java.util.ArrayList;

import org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding;

import com.test.goal.vo.MemberVO;


public interface MemberMapper {

	public int join(MemberVO vo); // 회원가입
	
	public MemberVO login(MemberVO vo); // 로그인

	public int updateMember(MemberVO vo); // 회원정보수정

	public MemberVO find(String email); // ID,Pwd 찾기

	public ArrayList<MemberVO> memberList(String userid); // 회원목록



	




	

}
