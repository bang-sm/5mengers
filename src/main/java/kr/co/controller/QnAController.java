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
	
		@RequestMapping(value = "/qna", method = RequestMethod.GET)
		public String qna() throws Exception {
			logger.info("QnA");
			
			return "/qna/qna";
		}
		@RequestMapping("/qnaDetail")
		public String qnaD() throws Exception {
			logger.info("QnA ��������");
			
			return "/qna/Detail";
		}
		@RequestMapping(value = "/qnaWrite", method = RequestMethod.GET)
		public String qnaW() throws Exception {
			
			logger.info("QnA �ۼ�������");
			
			return "/qna/Write";
		}
}