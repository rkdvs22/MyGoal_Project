package com.test.goal.dao;

import java.util.ArrayList;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MessageVO;

public interface MessageDAO {
	public boolean writeMsg(MessageVO vo);	//메시지 쓰기
	//public ArrayList<MemberVO> sendNReceiveList(String userid);
	public ArrayList<MemberVO> senderList(String userid);	//나에게 메시지 보낸 사람 리스트(9/11)
	public ArrayList<MemberVO> receiverList(String userid);	//내가 메시지 보낸 사람 리스트(9/11)
	public ArrayList<MessageVO> msgList(String userid, String id);	//메시지 채팅창 형식으로 출력
	public MessageVO readMsg(int msgNum);	//메시지 내용 읽기
	public void deleteMsg(int msgNum);	//메시지 삭제
}