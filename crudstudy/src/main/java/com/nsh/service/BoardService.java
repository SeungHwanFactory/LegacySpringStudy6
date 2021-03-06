package com.nsh.service;

import java.util.List;

import com.nsh.domain.BoardVO;
import com.nsh.domain.Paging;

public interface BoardService {

	public void register(BoardVO board);
	
	public BoardVO get(Long bno);
	
	public boolean modify(BoardVO board);
	
	public boolean remove(Long bno);
	
//	public List<BoardVO> getList();
	
	/*
	 * 게시글 목록을 페이징 처리하기 위해 파라미터로 Paging 객체를 받을 수 있도록 한다.
	 * */
	public List<BoardVO> getList(Paging page);
	
	/*
	 * 게시글 전체 데이터 수 처리
	 * */
	public int getTotal(Paging page);
}
