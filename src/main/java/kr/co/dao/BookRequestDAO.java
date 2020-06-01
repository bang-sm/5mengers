package kr.co.dao;

import kr.co.vo.BookRequestDTO;

public interface BookRequestDAO {
	
	public void bRWrite(BookRequestDTO bRequestDTO) throws Exception;

}
