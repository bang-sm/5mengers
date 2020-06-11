package kr.co.dao;

import java.util.List;

import org.json.simple.JSONObject;

import kr.co.vo.BookDetailDTO;
import kr.co.vo.BookRequestDTO;
import kr.co.vo.Criteria;
import kr.co.vo.UserVO;

public interface BookRequestDAO {
	
	// 게시글 작성
	public void Write(BookRequestDTO bRequestDTO) throws Exception;
	
	// 게시물 목록 조회
	public List<BookRequestDTO> list(Criteria cri) throws Exception;
	
	// 작성자 userid 가져오기
	public UserVO userid(int brb_id);
	
	// 게시물 총 갯수
	public int brbListCount();
	
	// 게시물 조회(brb_id 로 구분하여 게시물 불러오기?)
	public BookRequestDTO read(int brb_id) throws Exception;
	
	// 게시물 수정
	public void update(BookRequestDTO bRequestDTO) throws Exception;
	
	// 게시물 삭제
	public void delete(int brb_id) throws Exception;
	
	// 댓글 조회
	public List<BookRequestDTO> readReply(int brbr_id) throws Exception;
	
	// 댓글 작성
	public void writeReply(BookRequestDTO bRequestDTO) throws Exception;
	
	// 네이버 책 API 검색
	public void search(JSONObject keyword) throws Exception;
	
	//나의 판매중 책 리스트
	public List<BookDetailDTO> myBuyingBookList(int uuid);
}
