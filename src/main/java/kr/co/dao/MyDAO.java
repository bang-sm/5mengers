package kr.co.dao;

import java.util.List;

import kr.co.vo.BookDTO;

public interface MyDAO {
	
	public List<BookDTO> BookRegistList() throws Exception;
	
	//찜카운트
	public int zzimCount() throws Exception;
	//판매중인책카운트
	public int sellingBookCount() throws Exception;
	//구매중인책카운트
	public int buyingBookCount() throws Exception;
}
