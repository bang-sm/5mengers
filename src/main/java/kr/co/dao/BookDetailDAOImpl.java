package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BookDetailDTO;

@Repository
public class BookDetailDAOImpl implements BookDetailDAO{

	@Inject
	private SqlSession sqlSession;
	@Override
	public BookDetailDTO detail() throws Exception{
		// TODO Auto-generated method stub
		System.out.println("확인");
		return sqlSession.selectOne("book_detail");
	}
	@Override
	public BookDetailDTO like() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("zzim");
	}
	@Override
	public BookDetailDTO check_on() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("check_on");
	}

}
