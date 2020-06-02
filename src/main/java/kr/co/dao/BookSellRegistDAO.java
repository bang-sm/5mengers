package kr.co.dao;

import java.util.Map;

import kr.co.vo.BookSellRegistDTO;


public interface BookSellRegistDAO {
	
	public void write(BookSellRegistDTO bookSellRegistDTO) throws Exception;

	public void insertFile(Map<String, Object> map);

}
