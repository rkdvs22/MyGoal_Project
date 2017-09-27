package com.test.goal.dao;

import java.util.ArrayList;
import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MessageVO;

public interface HomeDAO {

	public ArrayList<BoardVO> homeBoard(); // 게시판 불러오기
	public ArrayList<MessageVO> homeMessage(String userid); //메시지 불러오기
	public MemberVO getMyInfo(String userid); // 자기정보
}
