package commons.interceptor;

import javax.inject.Inject;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;
import org.springframework.web.util.WebUtils;

import kr.co.service.UserService;
import kr.co.vo.UserVO;

public class RememberPreviousInterceptor extends HandlerInterceptorAdapter {
	
	private static final Logger logger = LoggerFactory.getLogger(RememberPreviousInterceptor.class);
	
	@Inject
	private UserService userService;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession httpSession = request.getSession();
		Cookie loginCookie = WebUtils.getCookie(request, "loginCookie");
		
		if(loginCookie != null) { // 접속한 사용자가 쿠키가 있다면, 
			UserVO userVO = userService.previousLoginCheck(loginCookie.getValue()); // 쿠키에서 사용자 정보 확인
			
			if(userVO != null) {  // 사용자 정보 확인 뒤, 세션에 회원 정보 추가!! 
				httpSession.setAttribute("login", userVO);
				logger.info("쿠키발급 ");
			}
		}
		
		return true;
	}
	
	
}
