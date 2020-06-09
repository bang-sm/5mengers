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

		@RequestMapping("/qna/readView")
		public String read(QnADTO qnaDTO, Model model) throws Exception {
			logger.info("QnA 상세페이지");
			
			model.addAttribute("read", service.read(qnaDTO.getQb_id()));
			
			return "/qna/readView";
		}
		
		// 수정페이지 수정 화면
		@RequestMapping(value = "qna/updateView", method = RequestMethod.GET)
		public String updateView(QnADTO qnaDTO, Model model) throws Exception {
			logger.info("/qna/updateView");
						
			model.addAttribute("update", service.read(qnaDTO.getQb_id()));
			
			return "qna/updateView";
		}
		
		// 게시물 수정하기
		@RequestMapping(value = "qna/update", method = RequestMethod.POST)
		public String update(QnADTO qnaDTO) throws Exception {
			logger.info("/qna/update");
			
			service.update(qnaDTO);
			
			return "redirect:/my/qnaList";					
		}
		
		// 게시물 삭제하기
		@RequestMapping(value = "qna/delete", method = RequestMethod.POST)
		public String delete(QnADTO qnaDTO) throws Exception {
			logger.info("/qna/delete");
			
			service.delete(qnaDTO.getQb_id());
			
			return "redirect:/my/qnaList";
		}
}