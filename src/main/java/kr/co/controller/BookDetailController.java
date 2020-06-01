package kr.co.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.BookDetailService;

@Controller
public class BookDetailController {

	private static final Logger logger = LoggerFactory.getLogger(BookRequestController.class);
	
	
	@Inject
	private BookDetailService service;
	
	
	@RequestMapping(value = "/bookdetail", method = RequestMethod.GET)
	public String bookdetail(Model model) throws Exception {
	    logger.info("책 상세 페이지");
		model.addAttribute("detail",service.detail());
		model.addAttribute("zzim",service.like());
		return "bookdetail/detail";
	}
	
	@RequestMapping(value = "/zzim_on", method = RequestMethod.GET)
	public String zzim(Model model) throws Exception {
	    logger.info("책 관심목록");
		model.addAttribute("check_on",service.check_on());
		return "bookdetail/detail";
	}
}
