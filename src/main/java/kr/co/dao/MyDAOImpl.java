package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.BookDTO;

@Repository
public class MyDAOImpl implements MyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BookDTO> BookRegistList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("BookRegistMapper.registList");
	}

}
