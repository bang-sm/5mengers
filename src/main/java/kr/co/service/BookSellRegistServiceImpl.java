package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.BookSellRegistDAO;
import kr.co.vo.BookSellRegistDTO;

@Service
public class BookSellRegistServiceImpl implements BookSellRegistService{
	
	@Inject
	private BookSellRegistDAO bookSellRegistdao;
	
	//�Խñ� �ۼ� 
	@Override
	public void write(BookSellRegistDTO bookSellRegistVO) throws Exception{
		
		
		bookSellRegistdao.write(bookSellRegistVO);
	}
	
	
	

}
