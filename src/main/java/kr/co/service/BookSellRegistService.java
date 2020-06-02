package kr.co.service;

import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.BookSellRegistDTO;

public interface BookSellRegistService {
	
	public void write(BookSellRegistDTO bookSellRegistDTO, MultipartHttpServletRequest mpRequest) throws Exception;

	void write(BookSellRegistDTO bookSellRegistDTO) throws Exception;



}
