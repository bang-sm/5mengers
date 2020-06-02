package kr.co.service;

import kr.co.vo.UserVO;

public interface UserService {

	// 회원 가입 처리
	void register(UserVO userVO) throws Exception;
	
}
