package kr.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping(value = "/my/boardList", method = RequestMethod.GET)
	public String myboard() throws Exception {
		logger.info("boardList");
		
		return "my/boardList";
	}
	@RequestMapping(value = "/my/qnaList", method = RequestMethod.GET)
	public String myqna() throws Exception {
		logger.info("qnaList");
		
		return "my/qnaList";
	}
}
