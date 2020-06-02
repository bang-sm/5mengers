package kr.co.dao;

import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BookSellRegistDTO;


@Repository
public class BookSellRegistDAOImpl implements BookSellRegistDAO {
	
	@Inject
	private SqlSession sqlSession;

	@Override
	public void write(BookSellRegistDTO bookSellRegistDTO) throws Exception {
		sqlSession.insert("book_sell_registMapper", bookSellRegistDTO);
		
	}

	@Override
	public void insertFile(Map<String, Object> map) {
		sqlSession.insert("boardMapper.insertFile", map);
		
	}
	
	
	
	

}
