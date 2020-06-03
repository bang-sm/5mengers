package kr.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/qna")
public class QnAController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
	
		@RequestMapping(value = "/qnaView", method = RequestMethod.GET)
		public String qna() throws Exception {
			logger.info("QnA");
			
			return "/qna/QnA";
		}
		@RequestMapping("/qnaDetail")
		public String qnaD() throws Exception {
			logger.info("QnA 상세페이지");
			
			return "/qna/QnADetail";
		}
		@RequestMapping(value = "/qnaWrite", method = RequestMethod.GET)
		public String qnaW() throws Exception {
			
			logger.info("QnA 작성페이지");
			
			return "/qna/QnAWrite";
		}
}