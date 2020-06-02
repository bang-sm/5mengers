package kr.co.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import kr.co.service.MyService;


@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);
	
	@Autowired
	private MyService myService;
	
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
	@RequestMapping(value = "/my/bookStatus", method = RequestMethod.GET)
	public String myStatus() throws Exception {
		logger.info("qnaList");
		
		return "my/bookStatus";
	}
}
