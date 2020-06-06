package kr.co.service;

import java.util.List;

import kr.co.vo.BookDetailDTO;

public interface MyService {
	//찜카운트
	public int zzimCount(int uuid) throws Exception;
	//판매중인책카운트
	public int sellingBookCount(int uuid) throws Exception;
	//구매중인책카운트
	public int buyingBookCount(int uuid) throws Exception;
	//현재 판매중인 책 리스트
	public List<BookDetailDTO> sellingBookList(int uuid) throws Exception;
	//현재 찜중인책
	public List<BookDetailDTO> sellingZzimList(int uuid) throws Exception;
	public List<BookDetailDTO> RequestList(int getuuid) throws Exception;
}
