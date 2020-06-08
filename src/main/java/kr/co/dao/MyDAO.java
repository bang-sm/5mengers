package kr.co.dao;

import java.util.List;

import kr.co.vo.BookDTO;
import kr.co.vo.BookDetailDTO;
import kr.co.vo.MyhistoryDTO;
import kr.co.vo.QnADTO;

public interface MyDAO {
	
	public List<BookDTO> BookRegistList() throws Exception;
	
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
	//구매요청중인책
	public List<BookDetailDTO> RequestList(int uuid) throws Exception;
	//나의 책 구매 히스토리
	public List<MyhistoryDTO> mybookhistory(int uuid,String startDate,String endDate) throws Exception;
	//나의qna리스트
	public List<QnADTO> qnaList(int uuid) throws Exception;
	
	
}
