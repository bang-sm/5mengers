package kr.co.dao;

import kr.co.vo.UserVO;

public interface UserDAO {

	// 회원가입 처리
	void register(UserVO userVO) throws Exception;
	
}
