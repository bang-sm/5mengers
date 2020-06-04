package kr.co.controller;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import commons.interceptor.AuthInterceptor;
import kr.co.service.UserService;
import kr.co.vo.LoginDTO;
import kr.co.vo.UserVO;

@Controller
@RequestMapping("/user")
public class UserController {

	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);
	
	@Inject
	private UserService userService;
	

	// 회원가입 페이지
	@RequestMapping(value = "/register" , method = RequestMethod.GET)
	public String registerGET() throws Exception {
		return "/user/register";
	}
		
	// 회원가입 처리
	@RequestMapping(value = "/register" , method = RequestMethod.POST)
	public String registerPOST(UserVO userVO, RedirectAttributes redirectAttributes	) throws Exception {
		
		String hashdPw = BCrypt.hashpw(userVO.getPass(), BCrypt.gensalt());
		userVO.setPass(hashdPw);
		userService.register(userVO);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
						
		return "redirect:/user/login";
	}
	
	
	
	// 로그인 창
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		
		return "user/login";
	}
	
	
	
	// 로그인 처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model) throws Exception{
		
		
		UserVO userVO = userService.login(loginDTO);
		
		if(userVO == null || !BCrypt.checkpw( loginDTO.getPass(), userVO.getPass() )) {
			
			return "redirect:/user/loginPost"; // 비밀번호 틀리면 메소드 종료!!
		}
		
		model.addAttribute("user", userVO);
		// 비밀번호 일치하면, model 에 userVO 를 user 에 저장!
		Object destination = httpSession.getAttribute("destination");
		
		if(destination != null || destination != "/") {
			
			return (String) destination;
		}
		return "/";
	}
	
	// loginPost 창 (로그인 틀렸을 경우 알림 띄우기 및 return)
	@RequestMapping(value = "/loginPost" , method = RequestMethod.GET)
	public String loginPostGET() throws Exception {
		
		return "/user/loginPost";
	}
	
	// 로그 아웃 처리!! 
	@RequestMapping(value = "/logout" , method = RequestMethod.GET)
	public String logout(HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		Object object = httpSession.getAttribute("login");
		if(object != null) { // Session에  login attribute 가 존재할 경우, 세션 초기화 
//			UserVO userVO = (UserVO) object;
			httpSession.removeAttribute("login");
			httpSession.invalidate();
		}
		
		
		return "/user/logout";
	}
		

	
		
}
