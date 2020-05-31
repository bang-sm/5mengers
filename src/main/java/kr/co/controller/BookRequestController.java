package kr.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/bookRequest")
public class BookRequestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookRequestController.class);
		
		@RequestMapping(value ="/bookRequest", method = RequestMethod.GET)
		public String test() throws Exception {
			logger.info("구매 요청 게시판");
			
			return "/bookRequest/Request";
		}
		@RequestMapping(value = "/bookRequestDetail", method = RequestMethod.GET)
		public String brd() throws Exception {
			logger.info("구매 요청 상세페이지");
			
			return "/bookRequest/Detail";
		}
		@RequestMapping(value="/bookRequestWrite", method = RequestMethod.GET)
		public String brw() throws Exception {
			logger.info("구매 요청 작성페이지");
			
			return "/bookRequest/Write";
		}
	}
