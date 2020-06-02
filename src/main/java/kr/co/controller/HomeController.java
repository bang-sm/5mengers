package kr.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/")
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String home() throws Exception {
			logger.info("home");
			
			return "home";
		}
		
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public String test() throws Exception {
			logger.info("join¿‘¥œ¥Ÿ");
			
			return "join/join";
		}
		
		
}
