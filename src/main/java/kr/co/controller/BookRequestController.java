package kr.co.controller;

import java.util.List;

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
import kr.co.vo.PageMaker;
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
		public String list(Model model,Criteria cri, PageMaker pageMaker) throws Exception {
			logger.info("brb/list");
			
			// 구매 요청 게시물 총 갯수
			pageMaker.setCri(cri);
			int brbcount=service.brbListCount();
			pageMaker.setTotalCount(brbcount);
			
			
			model.addAttribute("list", service.list(cri));
			model.addAttribute("pageMaker", pageMaker);
			
			return "/brb/list";
		}
		
		// 게시판 상세페이지
		@RequestMapping(value = "brb/readView", method = RequestMethod.GET)
		public String readView(BookRequestDTO bRequestDTO, Model model,HttpSession hs,UserVO uv) throws Exception {
			logger.info("brb/readView");
			uv = (UserVO) hs.getAttribute("login");
			int uuid = uv.getUuid();
			model.addAttribute("read", service.read(bRequestDTO.getBrb_id()));
			model.addAttribute("user", uuid);
			
			return "/brb/readView";
		}
		
		@ResponseBody
		@RequestMapping(value = "brb/mybooklist", method = RequestMethod.GET)
		public List<BookDetailDTO> readMyBook(int uuid) throws Exception {
			logger.info("brb/mybooklist");
			//내가 팔고있는 나의 책 리스트
			
			return 	service.myBuyingBookList(uuid);
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
		
		// 댓글 작성하기
		
		public String replyWrite(BookRequestDTO bRequestDTO) throws Exception {
			logger.info("/brb/replyWrite");
			
			service.writeReply(bRequestDTO);
			
			return "redirect:/brb/readView?brb_id=" + bRequestDTO.getBrb_id();
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
