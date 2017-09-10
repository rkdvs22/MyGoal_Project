package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MyFriendVO;

public interface FriendDAO {
	public ArrayList<MyFriendVO> openFriend(MyFriendVO fvo); // 친구목록
	public void deleteFriend1(MyFriendVO MyFriendDelete); // 친구삭제(내 입장)
	public void deleteFriend2(MyFriendVO MyFriendDelete); // 친구삭제(상대방 입장)
	public ArrayList<MemberVO> searchFriend(Map<String, String> map); // 친구검색
}
