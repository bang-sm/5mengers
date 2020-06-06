package kr.co.controller;


import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.junit.Assert;
import org.junit.Before;
import org.junit.Test;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import kr.co.service.BookDetailService;
import kr.co.vo.BookDetailDTO;
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
	public int bookcheck(int bsr_check,int bsr_id) throws Exception {
	    logger.info("예약중");
		int check = service.book_check(bsr_check,bsr_id);
		
		return check;
	}
	
	//글 수정 DB 값 가져와서 화면구성
	@RequestMapping(value ="/bookupdate",method =RequestMethod.GET)
	public String bookupdate(Model model,int bsr_id) throws Exception{
		logger.info("글 수정 페이지 이동");
		model.addAttribute("bookupdate",service.bookupdate(bsr_id));
		return "bookdetail/bookupdate";
	}
	
	
	//글수정시 bsr_update 값 변경
	@ResponseBody
	@RequestMapping(value ="/bookupdatecheck",method =RequestMethod.GET)
	public void bookupdatecheck(int bsr_id) throws Exception{
		logger.info("글 수정 페이지 이동시 DB 값 변경");
		service.bookupdatecheck(bsr_id);
	}
	//지도 연습입니당
	@RequestMapping(value ="/ex",method =RequestMethod.GET)
	public String bookupdate(Model model) throws Exception{
		logger.info("지도 연습");
		return "bookdetail/ex";
	}
	
	//글 수정 DB 값 넣기
	@RequestMapping(value ="/bookupdate_end",method =RequestMethod.POST)
	public String bookupdateend(BookDetailDTO bookDetailDTO) throws Exception{
		logger.info("글 수정");
		service.bookupdatecheckout(bookDetailDTO.getBsr_id());
		service.bookupdateend(bookDetailDTO);
		return "redirect:/my/nav";
	}
	
	//글 삭제 AJAX
	@ResponseBody
	@RequestMapping(value = "/book_delete", method = RequestMethod.GET)
	public void bookdelete(int bsr_id) throws Exception {
	    logger.info("글 삭제");
		service.book_delete(bsr_id);
	}
	 
	
	//bookapi 페이지
	@RequestMapping(value ="/bookapi",method =RequestMethod.GET)
	public String bookapi() throws Exception{
		logger.info("책 목록");
		return "bookdetail/bookapi";
	}
	
	//네이버 책  ajax
	@ResponseBody
	@RequestMapping(value ="/bookapicheck",method =RequestMethod.GET)
	public JSONObject bookapicheck(String keyword) throws Exception{
		logger.info("책 목록");
		logger.info("머가 오지: "+service.bookapi(keyword));
		return service.bookapi(keyword);
	}
	
	
}
