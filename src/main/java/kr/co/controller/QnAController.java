package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.QnAService;
import kr.co.vo.QnADTO;
import kr.co.vo.UserVO;



@Controller
public class QnAController {
	
	private static final Logger logger = LoggerFactory.getLogger(QnAController.class);
		
		@Inject
		QnAService service;
		
		@RequestMapping(value = "/qna/writeView", method = RequestMethod.GET)
		public void qnaView() throws Exception {
			logger.info("QnAWriteView");
			
		}
		@RequestMapping(value = "/qna/write", method = RequestMethod.POST)
		public String write(HttpSession httpSession, QnADTO qnaDTO) throws Exception {			
			
			logger.info("QnAWrite");
			
			
			UserVO userVO = (UserVO) httpSession.getAttribute("login");
					
			qnaDTO.setUuid(userVO.getUuid());
			
			service.write(qnaDTO);
			
			return "redirect:/";
		}
		@RequestMapping(value = "/qna/list", method = RequestMethod.GET)
		public String qna() throws Exception {
			logger.info("QnA");
			
			return "/qna/list";
		}
		@RequestMapping("/qna/detail")
		public String qnaD() throws Exception {
			logger.info("QnA 상세페이지");
			
			return "/qna/qnaDetail";
		}
}