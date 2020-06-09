package kr.co.controller;

import java.util.Date;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.annotation.JacksonInject.Value;

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
	
	// 중복 아이디 확인
	@ResponseBody
	@RequestMapping(value = "/idCheck" , method = RequestMethod.POST)
	public int idCheck(UserVO userVO) throws Exception {
		int result = userService.idCheck(userVO);
		
		return result;
	}
	
	// 회원가입 처리
	@RequestMapping(value = "/register" , method = RequestMethod.POST)
	public String registerPOST(UserVO userVO, RedirectAttributes redirectAttributes	, HttpSession httpSession) throws Exception {
		
		int result = userService.idCheck(userVO);
		
		if(result != 0) {
			return "/user/register";
		}
		
		String hashdPw = BCrypt.hashpw(userVO.getPass(), BCrypt.gensalt());
		userVO.setPass(hashdPw);
		userService.register(userVO);
		redirectAttributes.addFlashAttribute("msg", "REGISTERED");
		
		httpSession.invalidate();				
		return "redirect:/user/login";
	}
	
	
	// 로그인 창
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String loginGET(@ModelAttribute("loginDTO") LoginDTO loginDTO) {
		
		return "user/login";
	}
	
	
	// 로그인 처리
	@RequestMapping(value = "/loginPost", method = RequestMethod.POST)
	public String loginPOST(LoginDTO loginDTO, HttpSession httpSession, Model model , RedirectAttributes redirectAttributes) throws Exception{
		
		UserVO userVO = userService.login(loginDTO);
		
		if(userVO == null || !BCrypt.checkpw( loginDTO.getPass(), userVO.getPass())) {
			redirectAttributes.addFlashAttribute("msg", "FAILURE");
			
			return "redirect:/user/loginPost"; // 비밀번호 틀리면 메소드 종료!!
		}
		
		if(userVO.getAuth() == 0) {
			redirectAttributes.addAttribute("msg", "NOAUTH");
			
			return "redirect:/user/noAuth";
		}
		
		// 비밀번호 일치하면, model 에 userVO 를 user 에 저장!
		model.addAttribute("user", userVO);
		
		
		// 로그인 유지를 선택했을 경우!!
		if(loginDTO.isUseCookie()) {
			int cookieLife = 60 * 60 * 24 * 7; // 쿠키 생존 시간 ㅠㅠ (7일 설정)
			Date sessionLimit = new Date(System.currentTimeMillis() + (1000 * cookieLife)); // milisec 기준이라 1000을 곱해준다~!!

			userService.keepLogin(userVO.getUserid(), httpSession.getId(), sessionLimit);
		}
		
		
		Object destination = httpSession.getAttribute("destination");
//		httpSession.removeAttribute("destination");
		
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
	
	// noAuth 창 (auth 0 인 계정인 경우 알림 및 return)
	@RequestMapping(value = "/noAuth" , method = RequestMethod.GET)
	public String noAuthGET() throws Exception {
		
		return "/user/noAuth";
	}
	
	// 로그아웃 처리!! 
	@ResponseBody
	@RequestMapping(value = "/logout" , method = RequestMethod.GET)
	public void logout(HttpSession httpSession, HttpServletRequest request, HttpServletResponse response) throws Exception  {
		
		Object object = httpSession.getAttribute("login");
		
		if(object != null) { // Session에  login attribute 가 존재할 경우, 세션 초기화 
			
			UserVO userVO = (UserVO) object;
			
			httpSession.removeAttribute("login");
			httpSession.invalidate();
			
			Cookie loginCookie = WebUtils.getCookie(request, "loginCookie"); // 쿠키를 요청!!
			
			if(loginCookie != null) { // 쿠키가 있는 경우 -> 로그 아웃시 쿠키 제거!! 
				loginCookie.setPath("/");
				loginCookie.setMaxAge(0); // 쿠키 생명 0 으로 설정해서 쿠키 죽이기
				response.addCookie(loginCookie); // 디바이스에 쿠키 response
				
				userService.keepLogin(userVO.getUserid(), "none", new Date());
				
			} // 쿠키 제거 if 제거 end
			
		} // session 초기화 if end 
		
	}// logout() end
	
	// 카카오 API 로그인
	@RequestMapping(value = "/auth", method = RequestMethod.GET)
	public String kakaoLogin(@RequestParam("code") String code, HttpSession session) throws Exception {
		
		String accessToken = userService.getAccessToken(code);
		HashMap<String, Object> userInfo = userService.getUserInfo(accessToken);
		System.out.println("login Controller : " + accessToken);
		
		// nickname이 존재할 때, 토큰 등록
		if(userInfo.get("nickname") != null) {
			session.setAttribute("kakao", userInfo.get("nickname"));
			session.setAttribute("accessToken", accessToken);
		}
		
		return "redirect:/user/register";
	}
	
	// 비밀번호 찾기 페이지 
	@RequestMapping(value = "/findingPass", method = RequestMethod.GET)
	public String findingPassGET() throws Exception{
		return "user/findingPass";
	}
	
	// 비밀번호 변경 페이지
	@RequestMapping(value = "/updatePass", method = RequestMethod.GET)
	public String updatePassGET(HttpSession httpSession ) throws Exception{
		
		if(httpSession.getAttribute("kakaofindingPass") == "confirmed") {
			return "user/updatePass";
		}
		
		return "user/findingPass";
	}
	
	// 비밀번호 찾기 id 매칭 처리 
	@ResponseBody
	@RequestMapping(value = "/findingPass" , method = RequestMethod.POST)
	public int findingPassPOST(UserVO userVO, HttpSession session) throws Exception {
		
		int result = userService.idCheck(userVO);
		String userid = userVO.getUserid();
		session.setAttribute("changePassId", userid);
		
		return result;
	}
	
	// 카카오 API - 비밀번호 찾기 (AccessToken 유무 확인)
	@RequestMapping(value = "/findingPassAuth", method = RequestMethod.GET)
	public String kakaoFindingPass(@RequestParam("code") String code, HttpSession session, RedirectAttributes redirectAttributes) throws Exception {
		
		String accessToken = userService.getAccessToken(code);
		
		if(accessToken != "" || accessToken != null ) { 
			session.setAttribute("kakaofindingPass", "confirmed");
			return "redirect:/user/updatePass";
			
		}
		
		redirectAttributes.addAttribute("msg", "UNAUTHORIZED");
		return "redirect:/user/findingPass";
	}
	
	// 비밀번호 변경! POST!! 처리
	@RequestMapping(value = "/updatePass", method = RequestMethod.POST)
	public String updatePassPOST(String userid, String pass) throws Exception {
		String hashedPw = BCrypt.hashpw(pass, BCrypt.gensalt());
		userService.updatePass(userid, hashedPw);
		
		return "user/login";
	}
	
	
	
	
}
