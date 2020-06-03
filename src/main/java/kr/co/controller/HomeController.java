package kr.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.BookDetailService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
		
		@Autowired
		private BookDetailService service;
		
		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String home(Model model) throws Exception {
			logger.info("home");
			model.addAttribute("list",service.category());
			model.addAttribute("booklist",service.mainBookList());
			return "home";
		}
		
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public String test() throws Exception {
			logger.info("join");
			
			return "join/join";
		}
		
		
}
