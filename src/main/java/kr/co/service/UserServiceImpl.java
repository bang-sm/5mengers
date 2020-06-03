package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.UserDAO;
import kr.co.vo.LoginDTO;
import kr.co.vo.UserVO;

@Service
public class UserServiceImpl implements UserService {
	
	@Inject
	private UserDAO userDAO;
	
	
	
	
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
		// TODO Auto-generated method stub
		return userDAO.userbuysell();
	}

}
