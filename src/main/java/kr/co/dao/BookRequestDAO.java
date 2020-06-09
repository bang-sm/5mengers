package kr.co.dao;

import java.util.List;

import kr.co.vo.BookRequestDTO;

public interface BookRequestDAO {
	
	// 게시글 작성
	public void Write(BookRequestDTO bRequestDTO) throws Exception;
	
	// 게시물 목록 조회
	public List<BookRequestDTO> list() throws Exception;
	
	// 게시물 조회(brb_id 로 구분하여 게시물 불러오기?)
	public BookRequestDTO read(int brb_id) throws Exception;
	
	// 게시물 수정
	public void update(BookRequestDTO bRequestDTO) throws Exception;
	
	// 게시물 삭제
	public void delete(int brb_id) throws Exception;
	
	
	
	}
