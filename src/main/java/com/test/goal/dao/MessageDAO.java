package com.test.goal.dao;

import java.util.ArrayList;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MessageVO;

public interface MessageDAO {
	public boolean writeMsg(MessageVO vo);	//메시지 쓰기
	public ArrayList<MemberVO> sendNReceiveList(String userid);
	public ArrayList<MessageVO> msgList(String userid, String friend);
	public MessageVO readMsg(int msgNum);	//메시지 내용 읽기
	public void deleteMsg(int msgNum);	//메시지 삭제
}