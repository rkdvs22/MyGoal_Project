package com.test.goal.dao;

import java.util.ArrayList;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MessageVO;

public interface MessageMapper {
	public int writeMsg(MessageVO vo);	//메시지 쓰기
	public ArrayList<MemberVO> senderList(String userid);	//나에게 메시지 보낸 사람 목록 출력(9/11 수정)
	public ArrayList<MemberVO> receiverList(String userid);	//내가 메시지 보낸 사람 목록 출력(9/11 수정)
	public ArrayList<MessageVO> msgList(String userid, String id);	//채팅 형식으로 메시지 출력(9/7 생성)
	public MessageVO readMsg(int msgNum);	//메시지 내용 읽기
	public int deleteMsg(int msgNum);	//메시지 삭제
}