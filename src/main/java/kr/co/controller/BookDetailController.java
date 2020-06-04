package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.service.BookDetailService;
import kr.co.vo.UserVO;


@Controller
public class BookDetailController {

	private static final Logger logger = LoggerFactory.getLogger(BookDetailController.class);
	
	
	private void saveDestination(HttpServletRequest request) {
		String uri = request.getRequestURI();
		String query = request.getQueryString();
		
		if(query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
		
		if(request.getMethod().equals("GET")) {
			logger.info("destination : " + (uri + query));
			request.getSession().setAttribute("destination", uri + query);
			
		}
			
	}
	
	
	@Inject
	private BookDetailService service;
	
	//제품 상세 페이지
	@RequestMapping(value = "/bookdetail", method = RequestMethod.GET)
	public String bookdetail(Model model,int bsr_id,int uuid,int bsr_category,HttpSession ss,UserVO uv, HttpServletRequest request) throws Exception {
	    logger.info("책 상세 페이지");
	    uv = (UserVO) ss.getAttribute("login");
	    saveDestination(request);
	   
	    //판매자가 DB에 등록한 책 값들
   		model.addAttribute("detail",service.detail(bsr_id,uuid));
   		
   		//찜개수
   		model.addAttribute("zzim",service.like(bsr_id));
   		model.addAttribute("side_book",service.sidebook(bsr_category,bsr_id));
	    
   		//로그인 후 상세페이지 접근할때
   		if(uv !=null) {
   			int getuuid = uv.getUuid();  //접속한 사용자 uuid 값
   		    logger.info("현재 접속한 사용자의 uuid : "+uv.getUuid());
	    	model.addAttribute("zzim_check",service.cheking(bsr_id,getuuid));	
	    }
		return "bookdetail/detail";
	}
	
	// 찜 해제 AJAX
	@ResponseBody
	@RequestMapping(value = "/zzimoff", method = RequestMethod.GET)
	public void zzimout(int uuid,int bsr_id) throws Exception {
	    logger.info("책 관심목록 해제");
        service.check_off(uuid,bsr_id);
	}
	
	//찜 등록 AJAX
	@ResponseBody
	@RequestMapping(value = "/zzimon", method = RequestMethod.GET)
	public void zzimon(int uuid,int bsr_id) throws Exception {
	    logger.info("책 관심목록 등록");
		service.check_on(uuid,bsr_id);
	}
	
	//찜 개수 AJAX 표현
	@ResponseBody
	@RequestMapping(value = "/zzimcount", method = RequestMethod.GET)
	public int zzimcount(int bsr_id) throws Exception {
	    logger.info("책 관심목록");
		int count = service.check_count(bsr_id);
		return count;
				
	}
	
	//구매하기 버튼 클릭시 예약중 바뀌는 AJAX
	@ResponseBody
	@RequestMapping(value = "/book_check", method = RequestMethod.GET)
	public void bookcheck(int bsr_check,int bsr_id) throws Exception {
	    logger.info("예약중");
		service.book_check(bsr_check,bsr_id);
	}
	
	//글 수정
	@RequestMapping(value ="/bookupdate",method =RequestMethod.GET)
	public String bookupdate(Model model,int bsr_id) throws Exception{
		logger.info("글 수정 페이지 이동");
		model.addAttribute("bookupdate",service.bookupdate(bsr_id));
		return "bookdetail/bookupdate";
	}
}
