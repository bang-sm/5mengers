package kr.co.controller;

import java.util.List;

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
			logger.info("qna/writeView");
			
		}
		@RequestMapping(value = "/qna/write", method = RequestMethod.POST)
		public String write(HttpSession httpSession, QnADTO qnaDTO) throws Exception {			
			
			logger.info("/qna/write");
			
			
			UserVO userVO = (UserVO) httpSession.getAttribute("login");
					
			qnaDTO.setUuid(userVO.getUuid());
			
			service.write(qnaDTO);
			
			return "redirect:/my/qnaList";
		}

		@RequestMapping("/qna/readView")
		public String read(QnADTO qnaDTO, Model model) throws Exception {
			logger.info("QnA 상세페이지");
			
			model.addAttribute("read", service.read(qnaDTO.getQb_id()));
			
			List<QnADTO> replyList = service.readReply(qnaDTO.getQb_id());
			
			model.addAttribute("replyList", replyList);
			
			return "/qna/readView";
		}
		
		// 수정페이지 수정 화면
		@RequestMapping(value = "qna/updateView", method = RequestMethod.GET)
		public String updateView(QnADTO qnaDTO, Model model) throws Exception {
			logger.info("/qna/updateView");
			
			model.addAttribute("update", service.read(qnaDTO.getQb_id()));
			
			
			return "/qna/updateView";
		}
		
		// 게시물 수정하기
		@RequestMapping(value = "qna/update", method = RequestMethod.POST)
		public String update(HttpSession httpSession, QnADTO qnaDTO) throws Exception {
			logger.info("/qna/update");
			
			UserVO userVO = (UserVO) httpSession.getAttribute("login");
			
			qnaDTO.setUuid(userVO.getUuid());
			
			service.update(qnaDTO);
			
			return "redirect:/qna/readView?qb_id=" + qnaDTO.getQb_id();
		}
		
		// 게시물 삭제하기
		@RequestMapping(value = "qna/delete", method = RequestMethod.POST)
		public String delete(QnADTO qnaDTO) throws Exception {
			logger.info("/qna/delete");
			
			service.delete(qnaDTO.getQb_id());
			
			return "redirect:/my/qnaList";
		}
		
		// 댓글 작성하기
		@RequestMapping(value = "qna/replyWrite", method = RequestMethod.POST)
		public String replyWrite(QnADTO qnaDTO) throws Exception {
			logger.info("/qna/replyWrite");
			
			service.writeReply(qnaDTO);
			
			return "redirect:/qna/readView?qb_id=" + qnaDTO.getQb_id();
		}
}