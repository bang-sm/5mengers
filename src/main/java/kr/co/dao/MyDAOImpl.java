package kr.co.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.BookDTO;
import kr.co.vo.BookDetailDTO;
import kr.co.vo.MyhistoryDTO;
import kr.co.vo.QnADTO;

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
	@Override
	public List<BookDetailDTO> sellingZzimList(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userMapper.my_zzim_book_list",uuid);
	}
	@Override
	public List<BookDetailDTO> RequestList(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userMapper.my_request_book_list",uuid);
	}
	@Override
	public List<MyhistoryDTO> mybookhistory(int uuid,String startDate,String endDate)throws Exception {
		// TODO Auto-generated method stub
		HashMap<String, String> map =new HashMap<String, String>();
		map.put("uuid",Integer.toString(uuid));
		map.put("startDate",startDate);
		map.put("endDate",endDate);
		return sqlSession.selectList("userMapper.my_book_history",map);
	}
	@Override
	public List<QnADTO> qnaList(int uuid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("userMapper.my_qnaList",uuid);
	}

}
