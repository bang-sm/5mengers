package kr.co.service;

import org.json.simple.JSONObject;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.vo.BookSellRegistDTO;

public interface BookSellRegistService {
	
	public void write(BookSellRegistDTO bookSellRegistDTO, MultipartHttpServletRequest mpRequest) throws Exception;

	void write(BookSellRegistDTO bookSellRegistDTO) throws Exception;
	
	//네이버 책
	public JSONObject bookapi(String keyword) throws Exception;



}
