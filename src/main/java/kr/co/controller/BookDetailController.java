package kr.co.controller;

import javax.inject.Inject;
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
	
	
	@Inject
	private BookDetailService service;
	
	@RequestMapping(value = "/bookdetail", method = RequestMethod.GET)
	public String bookdetail(Model model,int bsr_id,int uuid,HttpSession ss,UserVO uv) throws Exception {
	    logger.info("책 상세 페이지");
	    uv = (UserVO) ss.getAttribute("login");
	    
	   
   		model.addAttribute("detail",service.detail(bsr_id,uuid));
   		model.addAttribute("zzim",service.like(bsr_id));
	    
   		if(uv !=null) {
   			int getuuid = uv.getUuid();  //접속한 사용자 uuid 값
   		    logger.info("현재 접속한 사용자의 uuid : "+uv.getUuid());
	    	model.addAttribute("zzim_check",service.cheking(bsr_id,getuuid));	
	    }
		return "bookdetail/detail";
	}
	@ResponseBody
	@RequestMapping(value = "/zzimoff", method = RequestMethod.GET)
	public void zzimout(int uuid,int bsr_id) throws Exception {
	    logger.info("책 관심목록 해제");
        service.check_off(uuid,bsr_id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/zzimon", method = RequestMethod.GET)
	public void zzimon(int uuid,int bsr_id) throws Exception {
	    logger.info("책 관심목록");
		service.check_on(uuid,bsr_id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/zzimcount", method = RequestMethod.GET)
	public int zzimcount(int bsr_id) throws Exception {
	    logger.info("책 관심목록");
		int count = service.check_count(bsr_id);
		return count;
				
	}
	
	@ResponseBody
	@RequestMapping(value = "/book_check", method = RequestMethod.GET)
	public void bookcheck(int bsr_check,int bsr_id) throws Exception {
	    logger.info("예약중");
		service.book_check(bsr_check,bsr_id);
	}
}
