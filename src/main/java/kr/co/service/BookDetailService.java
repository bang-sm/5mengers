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
	
	//구매요청 클릭시 DB 값 변경
	public void book_check(int bsr_check,int bsr_id) throws Exception;
	
	//구매하기시 구매자 DB 상태 업데이트   by-방석민
	public void buying_book(int uuid,int bsr_id) throws Exception;
	
	//bsr_status 값 가져오기
	public int bookactivecount(int bsr_id)  throws Exception;
	
	//책 같은 장르 구현
	public List<BookDetailDTO> sidebook(int bsr_category,int bsr_id) throws Exception;
	
	//책 카테고리 리스트
	public List<BookCategoryDTO> category() throws Exception;
	
	//메인책리스트
	public List<BookDetailDTO> mainBookList() throws Exception;
	
	//책 수정중 상태값 가져오기
	public void bookactive(int bsr_id,int bsr_status) throws Exception;
	
	//비활성화 !
	public void bookactiveoff(int bsr_id) throws Exception;
	
	//활성화 !
	public void bookactiveon(int bsr_id) throws Exception;
	
	//글 수정 데이터 가져오기
	public List<BookDetailDTO> bookupdate(int bsr_id) throws Exception;
	
	//글 수정 데이터 넣기
	public void bookupdateend(BookDetailDTO bookDetailDTO) throws Exception;


	//글 삭제 
	public void book_delete(int bsr_id) throws Exception;
	
	//네이버 책
	public JSONObject bookapi(String keyword) throws Exception;
	
	//상세페이지 접속시 bsr_status 는 비활성화
	public void bsrstatuscheck(int bsr_id) throws Exception;
	
	//사진 첨부 삭제
	public void deleteimagefile(int bsr_img_id,String bi_file_name) throws Exception;
	
	//DB에서 판매자 사진 이름 가져오기
	public List<BookDetailDTO> bookimg(int bsr_id) throws Exception;
	//autoSearch
	public List<String> autoSearch() throws Exception;

	//검색 책
	public Object mainBookSearchList(String bsr_name);

	public List<BookDetailDTO> mainCateBookList(String bc_code);
	

	
}
