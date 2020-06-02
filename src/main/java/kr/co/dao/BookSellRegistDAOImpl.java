package kr.co.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BookSellRegistDTO;


@Repository
public class BookSellRegistDAOImpl implements BookSellRegistDAO {
	
	@Inject
	private SqlSession sqlSession;

		// �Խñ� �ۼ�
	@Override
	public void write(BookSellRegistDTO bookSellRegistVO) throws Exception {
		sqlSession.insert("book_sell_registMapper.insert", bookSellRegistVO);
		
	}
	
	
	
	

}
