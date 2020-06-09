package kr.co.controller;


import java.io.File;
import java.io.IOException;
import java.util.UUID;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

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
	    logger.info("시작 ");
   		model.addAttribute("detail",service.detail(bsr_id,uuid));
   		logger.info("끝");
   		
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
	    logger.info("zzimoff / 책 관심목록 해제");
        service.check_off(uuid,bsr_id);
	}
	
	//찜 등록 AJAX
	@ResponseBody
	@RequestMapping(value = "/zzimon", method = RequestMethod.GET)
	public void zzimon(int uuid,int bsr_id) throws Exception {
	    logger.info("zzimon / 책 관심목록 등록");
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
	public void bookcheck(int bsr_check,int bsr_id,HttpSession hs,UserVO uv) throws Exception {
		logger.info("구매하기 db 값 변경");
		service.book_check(bsr_check,bsr_id);
		if(hs.getAttribute("login")==null) {
			logger.info("유저의 세션이 없습니다");
		}
		else {
			//구매하기 버튼시 예약중 처리를 하며 구매자 DB에 구입한 목록에 insert한다.
			uv = (UserVO) hs.getAttribute("login");
			int getuuid = uv.getUuid();
			service.buying_book(getuuid, bsr_id);
		}
	}
	
	//글 수정 DB 값 가져와서 화면구성
	@RequestMapping(value ="/bookupdate",method =RequestMethod.GET)
	public String bookupdate(Model model,int bsr_id) throws Exception{
		logger.info("글 수정 페이지 이동");
		model.addAttribute("bookupdate",service.bookupdate(bsr_id));
		return "bookdetail/bookupdate";
	}
	
	
	//글수정시 bsr_status 값 변경
	@ResponseBody
	@RequestMapping(value ="/bookactiveoff",method =RequestMethod.GET)
	public void bookactiveoff(int bsr_id) throws Exception{
		logger.info("글 수정 페이지 이동시 DB 값 변경 = 0");
		service.bookactiveoff(bsr_id);
	}
	
	//글수정시 bsr_status 값 변경
	@ResponseBody
	@RequestMapping(value ="/bookactiveon",method =RequestMethod.GET)
	public void bookactiveon(int bsr_id) throws Exception{
		logger.info("글 수정 페이지 이동시 DB 값 변경 = 1");
		service.bookactiveon(bsr_id);
	}
	
	
	@RequestMapping(value="/bookactive",method=RequestMethod.GET)
	public String bookactive(BookDetailDTO bookDetailDTO) throws Exception{
		logger.info("글 수정 페이지 이동시 DB 값 변경 ");
		int bsr_id = bookDetailDTO.getBsr_id();
		int bsr_status = bookDetailDTO.getBsr_status();
		
		int uuid= bookDetailDTO.getUuid();
		int bsr_category = bookDetailDTO.getBsr_category();
		service.bookactive(bsr_id,bsr_status);
		
		return "redirect:/bookdetail?bsr_id="+bsr_id+"&uuid="+uuid+"&bsr_category="+bsr_category;
	}
	
	//bsr_status 값 가져오기
	@ResponseBody
	@RequestMapping(value ="/bookactivecount",method =RequestMethod.GET)
	public int bookactive(int bsr_id) throws Exception{
		logger.info("글 수정 페이지 이동시 DB 값 가져오기");
		int check = service.bookactivecount(bsr_id);
		return check;
	}
	
	//지도 연습입니당
	@RequestMapping(value ="/ex",method =RequestMethod.GET)
	public String bookupdate(Model model) throws Exception{
		logger.info("지도 연습");
		return "bookdetail/ex";
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
	
	
	@ResponseBody
	@RequestMapping(value ="/bsrstatuscheck",method =RequestMethod.GET)
	public void bsrstatuscheck(int bsr_id) throws Exception{
		logger.info("상세페이지 접속시 bsr_status 는 비활성화");
		service.bsrstatuscheck(bsr_id);
	}
	
	

	//사진 첨부 삭제
	@ResponseBody
	@RequestMapping(value ="/deleteimagefile",method =RequestMethod.GET)
	public void deleteimagefile(int bsr_img_id) throws Exception{
		logger.info("상세페이지 접속시 bsr_status 는 비활성화");
		service.deleteimagefile(bsr_img_id);
    }
	
}
