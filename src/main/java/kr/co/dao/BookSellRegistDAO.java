package kr.co.dao;

import java.util.Map;

import kr.co.vo.BookSellRegistDTO;


public interface BookSellRegistDAO {
	
	public void write(BookSellRegistDTO bookSellRegistDTO) throws Exception;

	public void insertFile(Map<String, Object> map) throws Exception;
	
	//수정된 db 값 넣기(파일 제외 나머지 ) by.김성원
	public void detailupdate(BookSellRegistDTO bookSellRegistDTO) throws Exception;
		
	//수정된 db 값 넣기 (첨부 파일 업로드 ) by.김성원
	public void imageinsert(Map<String,Object> map) throws Exception;

}
