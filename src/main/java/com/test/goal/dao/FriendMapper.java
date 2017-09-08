package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;

import org.eclipse.jdt.internal.compiler.lookup.MemberTypeBinding;

import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MyFriendVO;

public interface FriendMapper {

	public ArrayList<MyFriendVO> friend(MyFriendVO fvo); // 친구목록

	public int deleteFriend1(String frdid); // 친구삭제(내 입장)
	
	public int deleteFriend2(String frdid); // 친구삭제(상대방 입장)

	public ArrayList<MemberVO> searchFriend(Map<String, String> map); // 친구검색


	




	

}
