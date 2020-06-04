package kr.co.service;

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
	
	
}
