package kr.co.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.BookSellRegistDTO;

public interface BookSellRegistService {
	
	public void write(BookSellRegistDTO bookSellRegistDTO, MultipartHttpServletRequest mpRequest) throws Exception;

	void write(BookSellRegistDTO bookSellRegistDTO) throws Exception;

	//수정된 db값 넣기 by.김성원
	public void imageinsert(BookSellRegistDTO bookSellRegistDTO, MultipartHttpServletRequest mpRequest) throws Exception;

}
