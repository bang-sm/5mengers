package kr.co.dao;

import java.util.List;

import kr.co.vo.BookCategoryDTO;
import kr.co.vo.BookDetailDTO;

public interface BookDetailDAO {
	
	public BookDetailDTO detail() throws Exception;
	
	public BookDetailDTO like() throws Exception;
	
	public BookDetailDTO check_on() throws Exception;
	
	public BookDetailDTO cheking() throws Exception;
	
	public void check_off(int uuid) throws Exception;
	
	public void check_on(int uuid,int bsr_id) throws Exception;
	
	public int check_count(int bsr_id) throws Exception;
	
	public void book_check(int bsr_check,int bsr_id) throws Exception;
	
	//책 카테고리 리스트
	public List<BookCategoryDTO> category() throws Exception;
	//메인책리스트
	public List<BookCategoryDTO> mainBookList() throws Exception;
}
