package kr.co.dao;

import java.util.List;

import kr.co.vo.BookDTO;

public interface MyDAO {
	
	public List<BookDTO> BookRegistList() throws Exception;
}
