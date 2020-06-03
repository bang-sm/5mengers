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
	
	@Override
	public BookDetailDTO detail(int bsr_id,int uuid) throws Exception {
		// TODO Auto-generated method stub
		return dao.detail(bsr_id,uuid);
	}

	@Override
	public BookDetailDTO like(int bsr_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.like(bsr_id);
	}

	@Override
	public BookDetailDTO check_on() throws Exception {
		 return dao.check_on();
		
	}

	@Override
	public BookDetailDTO cheking(int bsr_id, int uuid) throws Exception {
		return dao.cheking(bsr_id,uuid);
	}
	
	@Override
	public void check_off(int uuid,int bsr_id) throws Exception {
		 dao.check_off(uuid,bsr_id);
		
	}

	@Override
	public void check_on(int uuid, int bsr_id) throws Exception {
		dao.check_on(uuid,bsr_id);
	}

	@Override
	public int check_count(int bsr_id) throws Exception {
		return dao.check_count(bsr_id);
	}

	@Override
	public void book_check(int bsr_check,int bsr_id) throws Exception {
		dao.book_check(bsr_check,bsr_id);
	}

	@Override
	public List<BookCategoryDTO> category() throws Exception {
		// TODO Auto-generated method stub
		return dao.category();
	}

	@Override
	public List<BookCategoryDTO> mainBookList() throws Exception {
		// TODO Auto-generated method stub
		return dao.mainBookList();
	}

	



}
