package commons.interceptor;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
	
	
	// httpSession 에 user를 저장
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler, ModelAndView modelAndView) throws Exception {
		
		// 선언부
		HttpSession httpSession = request.getSession();
		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("user"); // Model interface에 임시로 담은 userVO 꺼내오기 (UserController)
		
		if(userVO != null) { // 로그인 성공 후 , userVO 에 해당하는 내용이 존재하면,
			
			logger.info("new login success"); // 로그인 성공하면 콘솔창에 info: new login success 뜸
			
			httpSession.setAttribute(LOGIN, userVO); // httpSession 에 user를 저장 ( user 는 userController 에서 확인)
//			response.sendRedirect("/"); // "/" 로 다이렉트
			
			
			// 로그인 페이지에서 로그인 유지 checkbox 클릭 시, 로그인 유지 쿠키 발행 (브라우저 닫아도 유지 - 쿠키 살아있는 동안)
			if(request.getParameter("useCookie") != null) {
				logger.info("remember cookie");

				// 쿠키 생성
				Cookie loginCookie = new Cookie("loginCookie", httpSession.getId()); // Cookie는 브라우저 종료시에도 사라지지 않는다, session id 값을 쿠키에 저장
				loginCookie.setPath("/"); // 웹 어플리케이션의 모든 URL에서 전송
				loginCookie.setMaxAge(60 * 60 * 24 * 7); // 쿠키 유지 시간: 7일
				
				// 쿠키 전송
				response.addCookie(loginCookie);
			}
			
			// destination 으로 경로 변경
			Object destination = httpSession.getAttribute("destination");
			response.sendRedirect(destination != null ? (String)destination : "/");
			
		} // end if
		
	} // end postHandle()
	
	
	
	
	// 기존의 로그인 정보가 있을 경우 초기화하는 역할
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession httpSession = request.getSession();
		// 기존 로그인 정보 제거
		if(httpSession.getAttribute(LOGIN) != null) { // httpSession 에 로그인 정보 존재하는 경우,
			
			logger.info("clear previous login data"); // 메소드 작동시 console창에 info
			httpSession.removeAttribute(LOGIN);
			
		}
		
		
		return true;
	
	} // end preHandle
	
	
} // end LoginInterceptor
