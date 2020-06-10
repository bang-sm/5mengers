package kr.co.service;

import java.util.List;

import org.json.simple.JSONObject;

import kr.co.vo.BookRequestDTO;
import kr.co.vo.Criteria;

public interface BookRequestService {
	
	// 게시글 작성
	public void write(BookRequestDTO bRequestDTO) throws Exception;
	
	// 게시물 목록 조회
	public List<BookRequestDTO> list(Criteria cri) throws Exception;
	// 게시물 총 갯수
	public int brbListCount();
	// 게시물 조회
	public BookRequestDTO read(int brb_id) throws Exception;

	// 게시물 수정
	public void update(BookRequestDTO bRequestDTO) throws Exception;
	
	// 게시물 삭제
	public void delete(int brb_id) throws Exception;
	
	// 네이버 책 API 가져오기
	public void search(JSONObject keyword) throws Exception;
}
