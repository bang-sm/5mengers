package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.BookDetailDAO;
import kr.co.vo.BookCategoryDTO;
import kr.co.vo.BookDetailDTO;

@Service
public class BookDetailServiceImpl implements BookDetailService{

	@Inject
	private BookDetailDAO dao;
	
	//DB에서 책 관련 값들 가져오기
	@Override
	public BookDetailDTO detail(int bsr_id,int uuid) throws Exception {
		// TODO Auto-generated method stub
		return dao.detail(bsr_id,uuid);
	}

	//DB에서 찜개수 가져오기
	@Override
	public BookDetailDTO like(int bsr_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.like(bsr_id);
	}

	//사용자 찜 확인
	@Override
	public BookDetailDTO cheking(int bsr_id, int uuid) throws Exception {
		return dao.cheking(bsr_id,uuid);
	}
	
	//찜 등록 해제 AJAX
	@Override
	public void check_off(int uuid,int bsr_id) throws Exception {
		 dao.check_off(uuid,bsr_id);
		
	}

	//찜 등록 AJAX
	@Override
	public void check_on(int uuid, int bsr_id) throws Exception {
		dao.check_on(uuid,bsr_id);
	}

	//찜 개수 AJAX 표현
	@Override
	public int check_count(int bsr_id) throws Exception {
		return dao.check_count(bsr_id);
	}

	//구매하기 버튼 클릭시 예약중 AJAX
	@Override
	public void book_check(int bsr_check,int bsr_id) throws Exception {
		dao.book_check(bsr_check,bsr_id);
	}

	//책 카테고리 리스트
	@Override
	public List<BookCategoryDTO> category() throws Exception {
		// TODO Auto-generated method stub
		return dao.category();
	}
	
	//메인책리스트
	@Override
	public List<BookCategoryDTO> mainBookList() throws Exception {
		// TODO Auto-generated method stub
		return dao.mainBookList();
	}

	//책 같은 장르 구현
	@Override
	public List<BookDetailDTO> sidebook(int bsr_category,int bsr_id) throws Exception {
		return dao.sidebook(bsr_category,bsr_id);
	}

	//책수정
	@Override
	public List<BookDetailDTO> bookupdate(int bsr_id) throws Exception {
		return dao.bookupdate(bsr_id);
	}

	

	



}
