package com.test.goal.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MessageVO;
import com.test.goal.vo.MyFriendVO;

@Repository
public class MessageDAOImpl implements MessageDAO {
	
	@Autowired
	private SqlSession sqlsession;
	
	//메시지 작성
	@Override
	public boolean writeMsg(MessageVO vo) {
		MessageMapper mapper = sqlsession.getMapper(MessageMapper.class);
		if (mapper.writeMsg(vo) != 0) return true;
		return false;
	}

	//메시지 내용 읽기
	@Override
	public MessageVO readMsg(int msgNum) {
		MessageMapper mapper = sqlsession.getMapper(MessageMapper.class);
		return mapper.readMsg(msgNum);
	}

	//메시지 삭제
	@Override
	public void deleteMsg(int msgNum) {
		MessageMapper mapper = sqlsession.getMapper(MessageMapper.class);
		mapper.deleteMsg(msgNum);
	}
/*
	@Override
	public ArrayList<MessageVO> receivedMsgList(String userid) {
		MessageMapper mapper = sqlsession.getMapper(MessageMapper.class);
		return mapper.receivedMsgList(userid);
	}

	@Override
	public ArrayList<MessageVO> sentMsgList(String userid) {
		MessageMapper mapper = sqlsession.getMapper(MessageMapper.class);
		return mapper.receivedMsgList(userid);
	}
*/

	//메시지를 주고 받은 사람 목록 불러오기
	@Override
	public ArrayList<MemberVO> sendNReceiveList(String userid) {
		MessageMapper mapper = sqlsession.getMapper(MessageMapper.class);
		return mapper.sendNReceiveList(userid);
	}
	
	//채팅 형식으로 메시지 출력
	@Override
	public ArrayList<MessageVO> msgList(String userid, String friend) {
		MessageMapper mapper = sqlsession.getMapper(MessageMapper.class);
		return mapper.msgList(userid, friend);
	}

}
