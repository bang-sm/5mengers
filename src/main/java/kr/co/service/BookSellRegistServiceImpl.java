package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.BookSellRegistDAO;
import kr.co.vo.BookSellRegistVO;

@Service
public class BookSellRegistServiceImpl implements BookSellRegistService{
	
	@Inject
	private BookSellRegistDAO bookSellRegistdao;
	
	//�Խñ� �ۼ� 
	@Override
	public void write(BookSellRegistVO bookSellRegistVO) throws Exception{
		bookSellRegistdao.write(bookSellRegistVO);
	}
	
	
	

}