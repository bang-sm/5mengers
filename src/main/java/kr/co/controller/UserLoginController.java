package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.service.UserService;
import kr.co.vo.LoginDTO;
import kr.co.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserLoginController {

	@Inject
	private UserService userService;
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		return "user/login";
	}
	
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception{
		
		UserVO userVO = userService.login(loginDTO);
	
		
		if(userVO == null || !BCrypt.checkpw( loginDTO.getPass(), userVO.getPass() )) {
			
			return "/loginPost"; // 비밀번호 틀리면 메소드 종료!!
		}
		
		model.addAttribute("user", userVO);
		// 비밀번호 일치하면, model 에 userVO 를 user 에 저장!
		
		return "/home";
	}
	
}
