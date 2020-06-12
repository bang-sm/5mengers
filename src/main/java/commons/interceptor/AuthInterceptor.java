package commons.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class AuthInterceptor extends HandlerInterceptorAdapter{
	
	private static final Logger logger = LoggerFactory.getLogger(AuthInterceptor.class);

	// 페이지 요청 정보 저장
	private void saveDestination(HttpServletRequest request) {
		String uri = "";
		String query = request.getQueryString();
		
		if(request.getRequestURI() == "/booksellregist") {
			
			logger.info("걸림");
			uri = "/";
			query = "";
			
		} else {
			logger.info("안걸림");
			uri = request.getRequestURI();
		}
		
		
		if(query == null || query.equals("null")) {
			query = "";
		} else {
			query = "?" + query;
		}
	
		if(request.getMethod().equals("GET")) {
			logger.info("destination : " + (uri + query));
			request.getSession().setAttribute("destination", uri + query);
			
		}
	}
	
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession httpSession = request.getSession();
		
		if(httpSession.getAttribute("login") == null) {
			
			logger.info("this user is not logined");
			
			saveDestination(request);
			response.sendRedirect("../user/login");
			return false;
		}
		
		return true;
	}
	
}
