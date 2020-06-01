package kr.co.dao;

import java.util.List;

import kr.co.vo.BookDetailDTO;

public interface BookDetailDAO {
	
	public BookDetailDTO detail() throws Exception;
	
	public BookDetailDTO like() throws Exception;
	
	public BookDetailDTO check_on() throws Exception;
}
