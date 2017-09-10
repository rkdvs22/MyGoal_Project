package com.test.goal.dao;

import java.util.ArrayList;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MessageVO;

public interface MessageMapper {
	public int writeMsg(MessageVO vo);	//메시지 쓰기
	//public ArrayList<MessageVO> receivedMsgList(String userid);	//받은 메시지 목록
	//public ArrayList<MessageVO> sentMsgList(String userid);	//보낸 메시지 목록
	public ArrayList<MemberVO> sendNReceiveList(String userid);	//메시지 주고 받은 사람 목록 출력(9/8 생성)
	public ArrayList<MessageVO> msgList(String userid, String friend);	//채팅 형식으로 메시지 출력(9/7 생성)
	public MessageVO readMsg(int msgNum);	//메시지 내용 읽기
	public int deleteMsg(int msgNum);	//메시지 삭제
}