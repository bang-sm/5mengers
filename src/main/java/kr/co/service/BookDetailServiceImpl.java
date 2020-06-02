package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.BookDetailDAO;
import kr.co.vo.BookDetailDTO;

@Service
public class BookDetailServiceImpl implements BookDetailService{

	@Inject
	private BookDetailDAO dao;
	
	@Override
	public BookDetailDTO detail() throws Exception {
		// TODO Auto-generated method stub
		return dao.detail();
	}

	@Override
	public BookDetailDTO like() throws Exception {
		// TODO Auto-generated method stub
		return dao.like();
	}

	@Override
	public BookDetailDTO check_on() throws Exception {
		 return dao.check_on();
		
	}

	@Override
	public BookDetailDTO cheking() throws Exception {
		return dao.cheking();
	}

	@Override
	public void check_off(int uuid) throws Exception {
		 dao.check_off(uuid);
		
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


}
