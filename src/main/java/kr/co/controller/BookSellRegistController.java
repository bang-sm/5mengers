package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.dao.BookSellRegistDAO;
import kr.co.service.BookSellRegistService;
import kr.co.vo.BookSellRegistDTO;

@Controller
public class BookSellRegistController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookSellRegistController.class);
	
	@Inject
	BookSellRegistService service;
	
	
	//게시판 글 작성 화면
	@RequestMapping(value = "/booksellregist", method = RequestMethod.GET)
	public String writeView() throws Exception {
		logger.info("booksellregist");
		
		return "/booksellregist/booksellregistPage";
	}
	
	//게시판 글 작성
	@RequestMapping(value = "/booksellregist", method = RequestMethod.POST)
	public String write(BookSellRegistDTO bookSellRegistDTO) throws Exception{
		logger.info("bookimg");
		
		service.write(bookSellRegistDTO);
		
		return "/booksellregist/booksellregistPage";
	}

}
