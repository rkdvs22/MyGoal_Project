package com.test.goal.dao;

import java.util.ArrayList;
import java.util.Map;
import com.test.goal.vo.MemberVO;
import com.test.goal.vo.MyFriendVO;

public interface FriendMapper {

	public ArrayList<MyFriendVO> openFriend(MyFriendVO fvo); // 친구목록

	public void deleteFriend1(MyFriendVO MyFriendDelete); // 친구삭제(내 입장)
	
	public void deleteFriend2(MyFriendVO MyFriendDelete); // 친구삭제(상대방 입장)

	public ArrayList<MemberVO> searchFriend(Map<String, String> map); // 친구검색

	public void addFriend(String userid, String frdid); // 친구등록

	public ArrayList<MyFriendVO> isFriend(String userid, String id); // 친구여부 : null이 아닐 때 친구 추가 버튼 비활성화


	




	

}
