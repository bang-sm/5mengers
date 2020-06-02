package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	
	@RequestMapping(value = "/booksellregistPage", method = RequestMethod.POST)
	// DTO로 보내서 DB에 저장한다 									// 첨부 파일의 파라미터값을 받음
	public String write(BookSellRegistDTO bookSellRegistDTO, MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("booksellregistPage");
		
		service.write(bookSellRegistDTO, mpRequest);
		// 데이터 전송 후 보여줄 page를 return함(현재페이지를 새로고침함)
		return "redirect:/booksellregist/booksellregistPage";
	}

}
