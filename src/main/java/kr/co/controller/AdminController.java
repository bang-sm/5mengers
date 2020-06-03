package kr.co.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.service.AdminService;
import kr.co.service.UserService;
import kr.co.vo.PopupDTO;

@Controller
public class AdminController {
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	@Autowired
	private UserService userService;
	@Autowired
	private AdminService adminService;

	//회원들의 판매개수 구매개수 리스트 표출하는 페이지
	@RequestMapping(value ="/admin/userlist", method = RequestMethod.GET)
	public String userBuySell(Model model) throws Exception {
		logger.info("/admin/userlist");
		model.addAttribute("userbuysell",userService.userbuysell());
		return "admin/userlist";
	}
	
	//팝업등록하고 리스트 보는 페이지
	@RequestMapping(value ="/admin/popupregist", method = RequestMethod.GET)
	public String popupRegist(Model model) throws Exception {
		logger.info("/admin/popupRegist");
		
		
		return "admin/popupRegist";
	}
	
	//팝업작성
	@RequestMapping(value ="/admin/popupWrite", method = RequestMethod.GET)
	public String popupWrite(Model model) throws Exception {
		logger.info("/admin/popupWrite");
		
		
		return "admin/popupWrite";
	}
	
	//팝업작성후 서브밋!
	
	@RequestMapping(value ="/admin/popupSubmit", method = RequestMethod.POST)
	public String popupWriteSubmit(Model model,@ModelAttribute PopupDTO popupDTO) throws Exception {
		logger.info("/admin/popupSubmit");
		logger.info(popupDTO.getNp_title()+"  제발..........");
		adminService.registPopup(popupDTO);
		
		return "admin/popupRegist";
	}
}
