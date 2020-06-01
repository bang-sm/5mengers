package kr.co.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BookSellRegistVO;


@Repository
public class BookSellRegistDAOImpl implements BookSellRegistDAO {
	
	@Inject
	private SqlSession sqlSession;

		// 게시글 작성
	@Override
	public void write(BookSellRegistVO bookSellRegistVO) throws Exception {
		sqlSession.insert("book_sell_registMapper.insert", bookSellRegistVO);
		
	}
	
	
	
	

}
