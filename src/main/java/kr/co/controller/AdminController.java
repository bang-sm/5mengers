package kr.co.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
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
		model.addAttribute("popupList",adminService.popupList());
		
		return "admin/popupRegist";
	}
	
	//팝업작성
	@RequestMapping(value ="/admin/popupWrite", method = RequestMethod.GET)
	public String popupWrite(Model model) throws Exception {
		logger.info("/admin/popupWrite");
		
		
		return "admin/popupWrite";
	}
	//팝업삭제
	@RequestMapping(value ="/admin/popup_delete", method = RequestMethod.GET)
	public String popupWrite(Model model,int np_id) throws Exception {
		logger.info("/admin/popup_delete");
		adminService.popupDelete(np_id);
		return "OK";
	}
	
	//팝업작성후 서브밋!
	@RequestMapping(value ="/admin/popupSubmit", method = RequestMethod.POST)
	public String popupWriteSubmit(Model model,@ModelAttribute PopupDTO popupDTO) throws Exception {
		logger.info("/admin/popupSubmit");
		adminService.registPopup(popupDTO);
		
		return "admin/popupRegist";
	}
	//공통해더에서 요청하여  디비내 팝업체크하는 역할
	@ResponseBody
	@RequestMapping(value ="/admin/popupCheck", method = RequestMethod.POST)
	public List<PopupDTO> popupCheck() throws Exception {
		logger.info("/admin/popupCheck");
		List<PopupDTO> pd=adminService.popupList();
		logger.info(pd +"");
		return pd;
	}
	
	//팝업상태변경
	@ResponseBody
	@RequestMapping(value ="/admin/popup_status_update", method = RequestMethod.POST)
	public String popup_status_update(@ModelAttribute PopupDTO popupDTO) throws Exception {
		logger.info("/admin/popup_status_update");
		
		adminService.popup_status_update(popupDTO);
		logger.info("popup_status_update_서비스 다녀왔습니다");
		
		return "OK";
	}
	//회원들의 판매개수 구매개수 리스트 표출하는 페이지
	@RequestMapping(value ="/admin/qnalist", method = RequestMethod.GET)
	public String userQnaList(Model model) throws Exception {
		logger.info("/admin/qnalist");
		model.addAttribute("userqnalist",adminService.userQnaList());
		return "admin/userQnaList";
	}
}
