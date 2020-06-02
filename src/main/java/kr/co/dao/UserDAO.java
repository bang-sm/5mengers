package kr.co.dao;

import kr.co.vo.LoginDTO;
import kr.co.vo.UserVO;

public interface UserDAO {

	// 회원가입 처리
	public void register(UserVO userVO) throws Exception;
	
	
	// 로그인 처리
	UserVO login(LoginDTO loginDTO) throws Exception;
}
