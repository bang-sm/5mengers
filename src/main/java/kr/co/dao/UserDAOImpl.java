package kr.co.dao;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.LoginDTO;
import kr.co.vo.UserVO;

@Repository
public class UserDAOImpl implements UserDAO {

//	private static final String NAMESPACE = "userMapper";
	
	@Inject
	private SqlSession sqlSession;
	
//	@Inject
//	public UserDAOImpl(SqlSession sqlSession) {
//		this.sqlSession = sqlSession;
//	}
	
	// 회원가입 처리
	@Override
	public void register(UserVO userVO) throws Exception {
		sqlSession.insert("userMapper.register", userVO);

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

	// 로그아웃 처리
	@Override
	public void logout(HttpSession session) {
		
	}
	
	// 로그인 유지
	@Override
	public void keepLogin(String userid, String sessionId, Date next) throws Exception {
		Map<String, Object> paramMap = new HashMap<>();
		paramMap.put("userid", userid);
		paramMap.put("sessionId", sessionId);
		paramMap.put("next", next);
		
		sqlSession.update("keepLogin", paramMap);
	}
	
	// 세션키 검증
	@Override
	public UserVO checkUserSessionKey(String value) throws Exception {
		
		return sqlSession.selectOne("checkUserSessionKey", value);
	}
	
	// 아이디 중복 체크
	@Override
	public int idCheck(UserVO userVO) throws Exception {
		
		int result = sqlSession.selectOne("userMapper.idCheck", userVO);
		
		return result;
	}
	
	// 로그인 권한 확인
	@Override
		public int authCheck(UserVO userVO) throws Exception {
			int result = sqlSession.selectOne("userMapper.authCheck", userVO);
			return result;
		}
	
	// 비밀번호 변경
	@Override
	public void updatePass(String userid, String pass) throws Exception {
		Map<String, Object> paramMap = new HashMap<String, Object>();
		paramMap.put("userid", userid);
		paramMap.put("pass", pass);
		sqlSession.update("userMapper.updatePass", paramMap);
		
	}
	
	
	
}
