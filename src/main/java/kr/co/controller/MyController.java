package kr.co.controller;


import java.util.HashMap;
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
	
	// 나의 QnA리스트
	@RequestMapping(value = "/my/qnaList", method = RequestMethod.GET)
	public String myQnaList(Model model,HttpSession hs,UserVO uv) throws Exception {
		logger.info("myQnaList");
		uv = (UserVO) hs.getAttribute("login");
		int getuuid = uv.getUuid();
		model.addAttribute("qnalist",myService.qnaList(getuuid));
		
		return "my/qnaList";
	}
	
	
	// 거래요청게시판 목록
	@RequestMapping(value = "/my/boardList", method = RequestMethod.GET)
	public String myboard() throws Exception {
		logger.info("boardList");
		
		
		return "my/boardList";
	}
	

	@RequestMapping(value = "/my/status", method = RequestMethod.GET)
	public String myqna() throws Exception {
		logger.info("status");
		
		return "my/status";
	}
	
	//구매완료된 리스트
	@RequestMapping(value = "/my/buycomplete", method = RequestMethod.GET)
	public String myBuyBookComplete(Model model,HttpSession hs,UserVO uv,String startDate,String endDate) throws Exception {
		logger.info("buycomplete");
		
		if(hs.getAttribute("login")==null) {
			logger.info("유저의 세션이 없습니다");
		}else {
			uv = (UserVO) hs.getAttribute("login");
			int getuuid = uv.getUuid();
			model.addAttribute("list",myService.mybookhistory(getuuid,startDate,endDate));
		}
		
		return "my/buycomplete";
	}
	
	//나의 판매중책
	@ResponseBody
	@RequestMapping(value = "/my/statusList", method = RequestMethod.GET)
	public List<BookDetailDTO> mysellbook(HttpSession hs,UserVO uv,String stat) throws Exception {
		//로그인유저의 정보
		if(hs.getAttribute("login")==null) {
			logger.info("유저의 세션이 없습니다");
		}
		else {
			uv = (UserVO) hs.getAttribute("login");
			int getuuid = uv.getUuid();
			List<BookDetailDTO> bookdto;
			
			//나의 책 리스트 페이지에서 AJAX를 통해 화면 표출
			//각 호출 구분자로 뿌리는 데이터를 달리한다.
			// S :판매중  Z:찜  R:구매요청중

			if(stat.equals("S")) {
				bookdto=myService.sellingBookList(getuuid);
				return bookdto;
			}
			else if(stat.equals("Z")) {
				bookdto=myService.sellingZzimList(getuuid);
				return bookdto;
			}else if(stat.equals("R")) {
				bookdto=myService.RequestList(getuuid);
				return bookdto;
			}
		}
		return null;
	}
}
