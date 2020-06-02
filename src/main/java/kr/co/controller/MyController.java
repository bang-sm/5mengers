package kr.co.controller;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;


import kr.co.service.MyService;


@Controller
public class MyController {
	private static final Logger logger = LoggerFactory.getLogger(MyController.class);
	
	@Autowired
	private MyService myService;
	
	//나의 인덱스페이지
	@RequestMapping(value = "/my/nav", method = RequestMethod.GET)
	public String myNav(Model model) throws Exception {
		logger.info("myNav");
		
		model.addAttribute("zzim",myService.zzimCount());
		model.addAttribute("sellingbook",myService.sellingBookCount());
		model.addAttribute("buyingbook",myService.buyingBookCount());
		
		return "my/nav";
	}
	
	// 거래요청게시판 목록
	@RequestMapping(value = "/my/boardList", method = RequestMethod.GET)
	public String myboard() throws Exception {
		logger.info("boardList");
		
		
		return "my/boardList";
	}
	
	//qna등록한 목록
	@RequestMapping(value = "/my/qnaList", method = RequestMethod.GET)
	public String myqna() throws Exception {
		logger.info("qnaList");
		
		return "my/qnaList";
	}
	//판매중인책
	@RequestMapping(value = "/my/sellbook", method = RequestMethod.GET)
	public String mySellBook() throws Exception {
		logger.info("mySellBook");
		
		return "my/sellbook";
	}
	//구매중인책
	@RequestMapping(value = "/my/buybook", method = RequestMethod.GET)
	public String mybuybook() throws Exception {
		logger.info("mybuybook");
		
		return "my/buybook";
	}
	//찜책
	@RequestMapping(value = "/my/zzim", method = RequestMethod.GET)
	public String myZzim() throws Exception {
		logger.info("myZzim");
		
		return "my/zzim";
	}
	//나의 책 등록 , 찜 목록 , 거래승인 내역
	@RequestMapping(value = "/my/bookStatus", method = RequestMethod.GET)
	public String myStatus() throws Exception {
		logger.info("qnaList");
		
		return "my/bookStatus";
	}
}
