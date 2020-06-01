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


}
