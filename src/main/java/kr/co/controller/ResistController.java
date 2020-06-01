package kr.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ResistController {
	
	private static final Logger logger = LoggerFactory.getLogger(ResistController.class);
	
	@RequestMapping(value = "/resist", method = RequestMethod.GET)
	public String home() throws Exception {
		logger.info("resist");
		
		return "/bookresist/resist";
	}

}
