package com.nsh.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.nsh.domain.BoardVO;
import com.nsh.domain.Paging;
import com.nsh.mapper.BoardMapper;

import lombok.extern.log4j.Log4j;

@Log4j
@Service
public class BoardServiceImpl implements BoardService{

	private BoardMapper mapper;
	
	@Autowired
	public BoardServiceImpl(BoardMapper mapper) {
		this.mapper = mapper;
	}	
	
	@Override
	public void register(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("작성: " + board);
		mapper.insertSelectKey(board);
		
	}

	@Override
	public BoardVO get(Long bno) {
		// TODO Auto-generated method stub
		log.info("조회: " + bno);
		return mapper.read(bno);
	}

	@Override
	public boolean modify(BoardVO board) {
		// TODO Auto-generated method stub
		log.info("수정: " + board);
		return mapper.update(board) == 1;
	}

	@Override
	public boolean remove(Long bno) {
		// TODO Auto-generated method stub
		log.info("삭제: " + bno);
		return mapper.delete(bno) == 1;
	}

//	@Override
//	public List<BoardVO> getList() {
//		// TODO Auto-generated method stub
//		log.info("list.....");
//		return mapper.getList();
//	}

	@Override
	public List<BoardVO> getList(Paging page) {
		log.info("서비스에서 페이징 처리를 요청합니다: " + page);
		return mapper.getListWithPaging(page);
	}

	@Override
	public int getTotal(Paging page) {
		log.info("서비스에서 전체 데이터의 개수 처리를 요청합니다: " + page);
		
		return mapper.getTotalCount(page);
	}

}
