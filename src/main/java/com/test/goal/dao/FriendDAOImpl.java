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
	public ArrayList<MyFriendVO> openFriend(MyFriendVO fvo) {
		FriendMapper mapper = sqlsession.getMapper(FriendMapper.class);
		return mapper.openFriend(fvo);
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

	// 친구등록
	@Override
	public void addFriend(String userid, String frdid) {
		FriendMapper mapper = sqlsession.getMapper(FriendMapper.class);
		mapper.addFriend(userid, frdid);
	}

	// 친구여부 : null이 아닐 때 친구 추가 버튼 비활성화
	@Override
	public ArrayList<MyFriendVO> isFriend(String userid, String id) {
		FriendMapper mapper = sqlsession.getMapper(FriendMapper.class);
		return mapper.isFriend(userid, id);
	}

	
	
}
