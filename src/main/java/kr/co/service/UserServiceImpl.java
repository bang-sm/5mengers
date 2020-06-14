package kr.co.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCrypt;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import common.mail.MailAlert;
import common.mail.MailHandler;
import common.mail.TempKey;
import kr.co.dao.UserDAO;
import kr.co.vo.LoginDTO;
import kr.co.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	
	private static final Logger logger = LoggerFactory.getLogger(UserServiceImpl.class); 
	
	@Inject
	private UserDAO userDAO;
	
	@Autowired
	private JavaMailSender mailSender;
	
	
	// 회원가입 처리
	@Override
	public void register(UserVO userVO) throws Exception {
					
		userDAO.register(userVO);
	}
	
	// 로그인
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		
		return userDAO.login(loginDTO);
	}
	
	//유저 판매.구매 카운트
	@Override
	public List<UserVO> userbuysell() throws Exception {
		return userDAO.userbuysell();
	}
	
	// 회원 로그인 체크
	@Override
	public boolean logincheck(UserVO userVO, HttpSession httpSession) throws Exception {
		// TODO : 중복로그인 확인 
		return false;
	}
	
	// 자동 로그인 서비스 (로그인 유지 method)
	@Override
	public void keepLogin(String userid, String sessionId, Date next) throws Exception {
		userDAO.keepLogin(userid, sessionId, next);
		
	}
	
	// 자동 로그인 서비스 (loginCookie로 회원정보 조회)
	@Override
	public UserVO previousLoginCheck(String value) throws Exception {
		return userDAO.checkUserSessionKey(value);
	}
	
	// 아이디 중복 체크
	@Override
	public int idCheck(UserVO userVO) throws Exception {
		int result = userDAO.idCheck(userVO);
		return result;
	}

	// 카카오 API access_token 받아오기
	@Override
	public String getAccessToken(String authorize_code) throws Exception {

		String accessToken = "";
		String refeshToken = "";
		String reqURL = "https://kauth.kakao.com/oauth/token"; // HOST : kauth.kakao.com , POST :  /oauth/token 
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
		    // POST 요청을 위해 기본값이 false인 setDoOutput을 true로 
			conn.setRequestMethod("POST"); // 포스트 방식으로 요청
			conn.setDoOutput(true); // default 값 : false
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			
			// POST request Parameter 확인  
			sb.append("grant_type=authorization_code"); // grant_type : authorization_code 로 고정  (required)
			sb.append("&client_id=fb1d8350db62c7161d16a4c91065256f"); // client_id : REST API 키 (required)
			sb.append("&redirect_uri=http://gksfk6165.cafe24.com/user/auth"); // redirect_uri : 코드가 리다이렉트 된 URI (required)
//			sb.append("&redirect_uri=http://localhost:8080/user/auth"); // redirect_uri : 코드가 리다이렉트 된 URI (required)
			sb.append("&code=" + authorize_code); // code : 코드 받기 요청으로 얻은 인증 코드 (required) 
			bw.write(sb.toString());
			bw.flush();
			
			// 결과 코드 
			int responseCode = conn.getResponseCode(); // 성공 : 200
			logger.info("responseCode = " + responseCode);
			
			// Json 타입의 response 받아오기 (POST request 결과)
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			
			logger.info("response body : " + result);
			
			// gson 라이브러리 사용 -> JSON parsing Object 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			accessToken = element.getAsJsonObject().get("access_token").getAsString();
			refeshToken = element.getAsJsonObject().get("refresh_token").getAsString();
			
			logger.info("access_token : " + accessToken );
			logger.info("refresh_token : " + refeshToken);
			
			br.close();
			bw.close();
			
		} catch (IOException e) {
			e.printStackTrace();
			
		} 
		
		return accessToken;
		
	} // 카카오 API access_token 받아오기
	
	// 카카오 API 사용자 정보 받아오기
	@Override
	public HashMap<String, Object> getUserInfo(String accessToken) throws Exception {

		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "Https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("POST");
			
			conn.setRequestProperty("Authorization", "Bearer " + accessToken);
			
			int responseCode = conn.getResponseCode();
			logger.info("responseCode : " + responseCode); // 200 이면 성공
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			
			String line = "";
			String result = "";
			
			while ((line = br.readLine()) != null) {
				result += line;
			}
			logger.info("response body : " + result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return userInfo;
		
	} // 카카오 API 사용자 정보 받아오기 end 
	
	// 카카오 API 사용 후 로그아웃  (안하니까 계속 남아있음;)
	@Override
	public void kakaoLogout(String accessToken) throws Exception {
		String reqURL = "https://kapi.kakao.com/v1/user/logout";
		
		
		try {
		URL url = new URL(reqURL);
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		
		conn.setRequestMethod("POST");
		conn.setRequestProperty("Authorization", "Bearer " + accessToken);
		
		int responseCode = conn.getResponseCode();
		System.out.println("responseCode : " + responseCode);
		
		BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
		String result = "";
		String line = "";
		
		while ((line = br.readLine()) != null) {
			result += line;
		}
		System.out.println(result);
		
		br.close();
		conn.disconnect();
		} catch (IOException e) {
			
			e.printStackTrace();
		}
		
	}
	
	// 로그인시 auth check!
	@Override
	public int authCheck(UserVO userVO) throws Exception {
		int result = userVO.getAuth();
		return result;
	}
	
	// 비밀번호 변경
	@Override
	public void updatePass(String userid, String pass) throws Exception {
		
		userDAO.updatePass(userid, pass);
	}
	
	// 이메일 검색
	@Override
	public void emailSend(String userid) throws Exception {
		
		// 임시 비밀번호 생성 및  DB 업데이트
		String newPass = new TempKey().generateKey(10);
		String scNewPass = BCrypt.hashpw(newPass, BCrypt.gensalt());
		userDAO.updatePass(userid, scNewPass);
		
		String mailAlert = new MailAlert().mailAlert(userDAO.emailSend(userid));
		
		// 메일 전송
		MailHandler sendMail = new MailHandler(mailSender);
		sendMail.setSubject("5MEN 임시 비빌번호 발급");
		sendMail.setContext(
				new StringBuffer()
				.append("<h1>임시비밀번호 발급</h1>")
				.append("<div><span>임시 비밀번호 : </span><input type='text' readonly='readonly' id='newPass' value='")
				.append(newPass)
				.append("'/>")
				.append("<span>로그인 후 비밀번호를 바꿔주세요</span>")
				.toString());
		
		sendMail.setFrom("hahayatong@gmail.com", "5MEN");
		sendMail.setTo(userDAO.emailSend(userid));
		sendMail.send();		
	}
	
	
	
}








