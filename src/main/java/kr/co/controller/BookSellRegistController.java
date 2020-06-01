package kr.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BookSellRegistController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookSellRegistController.class);
	
	@RequestMapping(value = "/booksellregist", method = RequestMethod.GET)
	public String home() throws Exception {
		logger.info("booksellregist");
		
		return "/booksellregist/booksellregistPage";
	}

}
