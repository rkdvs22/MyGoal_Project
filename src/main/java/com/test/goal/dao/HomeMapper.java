package com.test.goal.dao;

import java.util.ArrayList;
import com.test.goal.vo.BoardVO;
import com.test.goal.vo.MessageVO;

public interface HomeMapper {

	public ArrayList<BoardVO> homeBoard(); // 게시판 불러오기
	public ArrayList<MessageVO> homeMessage(String userid); // 메시지 불러오기

}
