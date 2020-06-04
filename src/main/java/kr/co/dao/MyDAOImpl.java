package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.BookDTO;
import kr.co.vo.BookDetailDTO;

@Repository
public class MyDAOImpl implements MyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<BookDTO> BookRegistList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("BookRegistMapper.registList");
	}
	//찜카운트
	@Override
	public int zzimCount(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.my_zzim_count",uuid);
	}
	
	//판매중인책 카운트
	@Override
	public int sellingBookCount(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.my_selling_count",uuid);
	}
	//구매중인책 카운트
	@Override
	public int buyingBookCount(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.my_buying_count",uuid);
	}
	@Override
	public List<BookDetailDTO> sellingBookList(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userMapper.my_selling_book_list",uuid);
	}

}
