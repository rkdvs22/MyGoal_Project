package com.test.goal.dao;

import java.util.ArrayList;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MessageVO;

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

	//나에게 메시지를 보낸 사람 목록 불러오기
	@Override
	public ArrayList<MemberVO> senderList(String userid) {
		MessageMapper mapper = sqlsession.getMapper(MessageMapper.class);
		return mapper.senderList(userid);
	}
	
	//채팅 형식으로 메시지 출력
	@Override
	public ArrayList<MessageVO> msgList(String userid, String id) {
		MessageMapper mapper = sqlsession.getMapper(MessageMapper.class);
		return mapper.msgList(userid, id);
	}	
}
