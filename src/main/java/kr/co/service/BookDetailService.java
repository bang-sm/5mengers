package kr.co.service;

import java.util.List;

import kr.co.vo.BookDetailDTO;

public interface BookDetailService {
	
	public BookDetailDTO detail() throws Exception;
	
	public BookDetailDTO like() throws Exception;
	
	public BookDetailDTO check_on() throws Exception;
}
