package kr.co.dao;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import kr.co.vo.LoginDTO;
import kr.co.vo.UserVO;

public interface UserDAO {

	// 회원가입 처리
	public void register(UserVO userVO) throws Exception;
	
	
	// 로그인 처리
	UserVO login(LoginDTO loginDTO) throws Exception;
	
	
	//회원 전체 구매내역 판매내역 받아오는처리
	public List<UserVO> userbuysell() throws Exception;
	
	// 회원 로그 아웃
	public void logout(HttpSession session);
	
	// 로그인 유지 처리
	public void keepLogin(String userid, String sessionId, Date next) throws Exception;
	
	// 세션키 검증
	public UserVO checkUserSessionKey(String value) throws Exception;
}
