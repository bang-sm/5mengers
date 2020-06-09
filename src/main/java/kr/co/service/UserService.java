package kr.co.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.vo.LoginDTO;
import kr.co.vo.UserVO;

public interface UserService {

	// 회원 가입 처리
	void register(UserVO userVO) throws Exception;
	
	// 로그인 처리 
	UserVO login(LoginDTO loginDTO) throws Exception;	
	
	//회원 전체 구매내역 판매내역 받아오는처리
	public List<UserVO> userbuysell() throws Exception;
	
	// 회원 로그인 체크
	public boolean logincheck(UserVO userVO, HttpSession httpSession) throws Exception;
	
	// 자동 로그인 서비스 (로그인 유지 method)
	void keepLogin(String userid, String sessionId, Date next) throws Exception;
	
	// 자동 로그인 서비스 (loginCookie로 회원정보 조회)
	UserVO previousLoginCheck(String value) throws Exception;
	
	// 아이디 중복체크
	public int idCheck(UserVO userVO) throws Exception;
	
	// 카카오API AccessToken 받기
	public String getAccessToken(String authorize_code) throws Exception;
	
	// 카카오 API 에서 회원 닉네임 받아오기
	public HashMap<String, Object> getUserInfo(String accessToken) throws Exception;
	
	// 로그인 권한 체크
	public int authCheck(UserVO userVO) throws Exception;
	
	
		
	
	
	
	
	
	
}
