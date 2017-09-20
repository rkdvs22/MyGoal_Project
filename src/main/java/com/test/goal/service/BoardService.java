package com.test.goal.service;

import java.util.ArrayList;
import java.util.Map;

import com.test.goal.util.PageNavigator;
import com.test.goal.vo.BoardVO;

public interface BoardService {

	public ArrayList<BoardVO> boardList(Map<String, String> map, PageNavigator navi); // 게시글 목록, 검색, 페이징

	public PageNavigator getNavi(int currentPage, Map<String, String> map); // 페이징 : 전체 게시글 수 가져오기

	public void addFavorite(int boardnum); // 좋아요

}
