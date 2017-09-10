package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MyFriendVO;

@Repository
public class FriendDAOImpl implements FriendDAO {

	@Autowired
	private SqlSession sqlsession;
	
	// 친구목록
	@Override
	public ArrayList<MyFriendVO> friend(MyFriendVO fvo) {
		FriendMapper mapper = sqlsession.getMapper(FriendMapper.class);
		return mapper.friend(fvo);
	}

	// 친구삭제 (내 입장)
	@Override
	public void deleteFriend1(MyFriendVO MyFriendDelete) {
		FriendMapper mapper = sqlsession.getMapper(FriendMapper.class);
		mapper.deleteFriend1(MyFriendDelete);
	}
	
	// 친구삭제 (상대방 입장)
	@Override
	public void deleteFriend2(MyFriendVO MyFriendDelete) {
		FriendMapper mapper = sqlsession.getMapper(FriendMapper.class);
		mapper.deleteFriend2(MyFriendDelete);
	}

	// 친구검색
	@Override
	public ArrayList<MemberVO> searchFriend(Map<String, String> map) {
		FriendMapper mapper = sqlsession.getMapper(FriendMapper.class);
		return mapper.searchFriend(map);
	}
	
	
}
