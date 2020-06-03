package commons.interceptor;

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
			response.sendRedirect("/"); // "/" 로 다이렉트
			
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
