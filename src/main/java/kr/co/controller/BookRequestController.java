package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.service.BookRequestService;
import kr.co.vo.BookDetailDTO;
import kr.co.vo.BookRequestDTO;
import kr.co.vo.Criteria;
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
		public String write(HttpSession httpSession, BookRequestDTO bRequestDTO, BookDetailDTO bookDetailDTO) throws Exception {
			logger.info("brb/write");
			
			UserVO userVO = (UserVO) httpSession.getAttribute("login");
			
			bRequestDTO.setUuid(userVO.getUuid());
			
			service.write(bRequestDTO);
			
			return "redirect:/";
		}
		
		// 게시판 목록
		@RequestMapping(value ="brb/list", method = RequestMethod.GET)
		public String list(Model model,Criteria criteria) throws Exception {
			logger.info("brb/list");
			
			model.addAttribute("list", service.list(criteria));
			
			return "/brb/list";
		}
		
		// 게시판 상세페이지
		@RequestMapping(value = "brb/readView", method = RequestMethod.GET)
		public String read(BookRequestDTO bRequestDTO, Model model) throws Exception {
			logger.info("brb/readView");			
			
			model.addAttribute("read", service.read(bRequestDTO.getBrb_id()));
			
			return "/brb/readView";
		}
		
		// 수정페이지 수정 화면
		@RequestMapping(value = "brb/updateView", method = RequestMethod.GET)
		public String updateView(BookRequestDTO bRequestDTO, Model model) throws Exception {
			logger.info("/brb/updateView");
						
			model.addAttribute("update", service.read(bRequestDTO.getBrb_id()));
			
			return "brb/updateView";
		}
		
		// 게시물 수정하기
		@RequestMapping(value = "brb/update", method = RequestMethod.POST)
		public String update(BookRequestDTO bRequestDTO) throws Exception {
			logger.info("/brb/update");
			
			service.update(bRequestDTO);
			
			return "redirect:/brb/list";					
		}
		
		// 게시물 삭제하기
		@RequestMapping(value = "brb/delete", method = RequestMethod.POST)
		public String delete(BookRequestDTO bRequestDTO) throws Exception {
			logger.info("/brb/delete");
			
			service.delete(bRequestDTO.getBrb_id());
			
			return "redirect:/brb/list";
		}
		
		// 네이버 책 API 가져오기(ajax)
		@ResponseBody
		@RequestMapping(value = "/bSearch", method = RequestMethod.GET)
		public void search(JSONObject keyword) throws Exception {
			logger.info("/brb/search");
			System.out.println(keyword);
			service.search(keyword);
			
			
		}
		
		
	}
