package kr.co.controller;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.service.BookDetailService;

@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	
		@Autowired
		private BookDetailService service;
		
		@RequestMapping(value = "/", method = RequestMethod.GET)
		public String home(Model model,String bsr_name,HttpServletRequest request) throws Exception {
			logger.info("home");
			
			
			String bc_code=request.getParameter("bc_code");
			if(bsr_name==null) {
				model.addAttribute("list",service.category());
				if(bc_code!=null) {
					model.addAttribute("booklist",service.mainCateBookList(bc_code));
				}else {
					model.addAttribute("booklist",service.mainBookList());
				}
			}else {
				model.addAttribute("list",service.category());
				model.addAttribute("booklist",service.mainBookSearchList(bsr_name));
			}
			
		      
			return "home";
		}
		
		@RequestMapping(value = "/join", method = RequestMethod.GET)
		public String test() throws Exception {
			logger.info("join");
			
			return "join/join";
		}
		
		
		//홈에서 자동완성을 위한 ajax 컨트롤러
		@ResponseBody
		@RequestMapping(value = "/home/autoSerach", method = RequestMethod.GET, produces="text/plain;charset=UTF-8")
		public String autoSerach() throws Exception {
			logger.info("autoSerach");
			//디비에서 책제목을 제이슨 형식으로 받아온다.
			String autolist = JSONArray.toJSONString(service.autoSearch());
			return autolist;
		}
}
		
