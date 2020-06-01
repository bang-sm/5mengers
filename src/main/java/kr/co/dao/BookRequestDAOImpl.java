package kr.co.dao;


import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.vo.BookRequestDTO;

@Repository
public class BookRequestDAOImpl implements BookRequestDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void bRWrite(BookRequestDTO bRequestDTO) throws Exception {
		
	}
}
