package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.LoginDTO;
import kr.co.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

//	private static final String NAMESPACE = "../userMapper";
	
	@Inject
	private SqlSession sqlSession;
	
//	@Inject
//	public UserDAOImpl(SqlSession sqlSession) {
//		this.sqlSession = sqlSession;
//	}
	
	// 회원가입 처리
	@Override
	public void register(UserVO userVO) throws Exception {
		sqlSession.insert("register", userVO);

	}
	
	// 로그인 처리
	@Override
	public UserVO login(LoginDTO loginDTO) throws Exception {
		
		return sqlSession.selectOne("login", loginDTO);
	}
	//회원 전체 구매내역 판매내역 받아오는처리
	@Override
	public List<UserVO> userbuysell() throws Exception {
		return sqlSession.selectList("userMapper.deal_list");
		
		
	}

}
