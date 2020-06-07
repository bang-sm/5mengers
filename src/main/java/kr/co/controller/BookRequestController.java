package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.BookRequestService;
import kr.co.vo.BookRequestDTO;
import kr.co.vo.UserVO;

@Controller
public class BookRequestController {
	
	private static final Logger logger = LoggerFactory.getLogger(BookRequestController.class);
		
		@Inject
		BookRequestService service;
		
		// 작성페이지 작성 화면
		@RequestMapping(value="/brb/writeView", method = RequestMethod.GET)
		public void writeView() throws Exception {
			logger.info("brb/writeView");
		
		}
		
		// 작성 내용
		@RequestMapping(value="brb/write", method = RequestMethod.POST)
		public String write(HttpSession httpSession, BookRequestDTO bRequestDTO) throws Exception {
			logger.info("brb/write");
			
			UserVO userVO = (UserVO) httpSession.getAttribute("login");
			
			bRequestDTO.setUuid(userVO.getUuid());
			
			service.write(bRequestDTO);
			
			return "redirect:/";
		}
		
		// 게시판 목록
		@RequestMapping(value ="brb/list", method = RequestMethod.GET)
		public String list(Model model) throws Exception {
			logger.info("brb/list");
			
			model.addAttribute("list", service.list());
			return "/brb/list";
		}
		
		// 게시판 목록 불러오기
		@RequestMapping(value = "brb/readView", method = RequestMethod.GET)
		public String read(BookRequestDTO bRequestDTO, Model model) throws Exception {
			logger.info("brb/readView");
			
			model.addAttribute("read", service.read(bRequestDTO.getBrb_id()));
			return "/brb/readView";
		}
		
		@RequestMapping(value = "brb/updateView", method = RequestMethod.GET)
		public String updateView(BookRequestDTO bRequestDTO, Model model) throws Exception {
			logger.info("/brb/updateView");
			
			model.addAttribute("update", service.read(bRequestDTO.getBrb_id()));
			
			return "brb/updateView";
		}
		
		@RequestMapping(value = "brb/update", method = RequestMethod.POST)
		public String update(BookRequestDTO bRequestDTO) throws Exception {
			logger.info("/brb/update");
			
			service.update(bRequestDTO);
			
			return "redirect:/brb/list";					
		}
		
		@RequestMapping(value = "brb/delete", method = RequestMethod.POST)
		public String delete(BookRequestDTO bRequestDTO) throws Exception {
			logger.info("/brb/delete");
			
			service.delete(bRequestDTO.getBrb_id());
			
			return "redirect:/brb/list";
		}
		
		
		
		
		@RequestMapping(value = "brb/Detail", method = RequestMethod.GET)
		public String brd() throws Exception {
			logger.info("구매 요청 상세페이지");
			
			return "/brb/BookRequestDetail";
		}
		
		
	}
