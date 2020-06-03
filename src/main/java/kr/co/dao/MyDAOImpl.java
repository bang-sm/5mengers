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
	//찜카운트
	@Override
	public int zzimCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.my_zzim_count");
	}
	
	//판매중인책 카운트
	@Override
	public int sellingBookCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.my_selling_count");
	}
	//구매중인책 카운트
	@Override
	public int buyingBookCount() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("userMapper.my_buying_count");
	}

}
