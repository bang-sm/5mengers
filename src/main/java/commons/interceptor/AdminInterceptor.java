package commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.vo.UserVO;

public class AdminInterceptor extends HandlerInterceptorAdapter{

	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession httpSession = request.getSession();
		
		if(  httpSession.getAttribute("login") == null || ((UserVO)httpSession.getAttribute("login")).getAuth() != 2) {
			
			logger.info("NOT ADMIN");
			
			response.sendRedirect("/");
			return false;
			
		}
		
		return true;
	}
	
}
