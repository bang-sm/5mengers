package kr.co.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.service.MyService;
import kr.co.vo.BookDTO;
import kr.co.vo.BookDetailDTO;
import kr.co.vo.UserVO;


@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);
	
	@Autowired
	private MyService myService;
	
	
	/**
	 * 나의 Nav 페이지
	 * @param model 데이터를 담아 화면에 넘겨준다
	 * @param hs 세션으로 현재 유저의 정보를 받아온다
	 * @param uv 유저객체 
	 */
	@RequestMapping(value = "/my/nav", method = RequestMethod.GET)
	public String myNav(Model model,HttpSession hs,UserVO uv) throws Exception {
		logger.info("myNav");
		//로그인유저의 정보
		uv = (UserVO) hs.getAttribute("login");
		int getuuid = uv.getUuid();
		model.addAttribute("zzim",myService.zzimCount(getuuid));
		model.addAttribute("sellingbook",myService.sellingBookCount(getuuid));
		model.addAttribute("buyingbook",myService.buyingBookCount(getuuid));
		
		return "my/nav";
	}
	
	// 거래요청게시판 목록
	@RequestMapping(value = "/my/boardList", method = RequestMethod.GET)
	public String myboard() throws Exception {
		logger.info("boardList");
		
		
		return "my/boardList";
	}
	

	@RequestMapping(value = "/my/sellList", method = RequestMethod.GET)
	public String myqna() throws Exception {
		logger.info("qnaList");
		
		return "my/sellList";
	}
	
	//나의 판매중책
	@ResponseBody
	@RequestMapping(value = "/my/sellbook", method = RequestMethod.GET)
	public List<BookDetailDTO> mysellbook(HttpSession hs,UserVO uv,Model model) throws Exception {
		logger.info("sellbook");
		//로그인유저의 정보
		uv = (UserVO) hs.getAttribute("login");
		int getuuid = uv.getUuid();
		
		List<BookDetailDTO> bookdto=myService.sellingBookList(getuuid);
		model.addAttribute("sellbook",bookdto);
		logger.info(bookdto +"");
		return bookdto;
	}
}
