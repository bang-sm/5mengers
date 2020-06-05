package kr.co.service;

import java.util.List;

import org.json.simple.JSONObject;


import kr.co.vo.BookCategoryDTO;
import kr.co.vo.BookDetailDTO;

public interface BookDetailService {
	
	//DB에서 책 관련 값들 가져오기
	public BookDetailDTO detail(int bsr_id,int uuid) throws Exception;
	
	//DB에서 찜개수 가져오기
	public BookDetailDTO like(int bsr_id) throws Exception;
	
	
	//사용자 찜 확인
	public BookDetailDTO cheking(int bsr_id,int uuid) throws Exception;
	
	//찜 등록 해제 AJAX
	public void check_off(int uuid,int bsr_id) throws Exception;
	
	//찜 등록 AJAX
	public void check_on(int uuid,int bsr_id) throws Exception;
	
	//찜 개수 AJAX 표현
	public int check_count(int bsr_id) throws Exception;
	
	//구매하기 버튼 클릭시 예약중 AJAX
	public void book_check(int bsr_check,int bsr_id) throws Exception;
	
	//책 같은 장르 구현
	public List<BookDetailDTO> sidebook(int bsr_category,int bsr_id) throws Exception;
	
	
	//책 카테고리 리스트
	public List<BookCategoryDTO> category() throws Exception;
	//메인책리스트
	public List<BookCategoryDTO> mainBookList() throws Exception;
	
	//글 수정 데이터 가져오기
	public List<BookDetailDTO> bookupdate(int bsr_id) throws Exception;
	
	//글 수정 데이터 넣기
	public void bookupdateend(BookDetailDTO bookDetailDTO) throws Exception;
	
	//글 삭제 
	public void book_delete(int bsr_id) throws Exception;
	
	//네이버 책
	public JSONObject bookapi(String keyword) throws Exception;
	
}
