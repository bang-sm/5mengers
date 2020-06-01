package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.BookSellRegistDAO;
import kr.co.vo.BookSellRegistVO;

@Service
public class BookSellRegistServiceImpl implements BookSellRegistService{
	
	@Inject
	private BookSellRegistDAO bookSellRegistdao;
	
	//게시글 작성 
	@Override
	public void write(BookSellRegistVO bookSellRegistVO) throws Exception{
		bookSellRegistdao.write(bookSellRegistVO);
	}
	
	
	

}
