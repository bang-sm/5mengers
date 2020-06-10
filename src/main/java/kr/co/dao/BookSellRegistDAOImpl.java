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
		sqlSession.insert("BookSellRegistDAO.book_sell_registMapper", bookSellRegistDTO);
		
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception{
		sqlSession.insert("BookSellRegistDAO.insertFile", map);
		
	}

	//수정된 db 값 넣기(파일 제외 나머지 ) by.김성원
	@Override
	public void detailupdate(BookSellRegistDTO bookSellRegistDTO) throws Exception {
		// TODO Auto-generated method stub
		sqlSession.update("BookSellRegistDAO.detailupdate",bookSellRegistDTO);
		
	}

	//수정된 db 값 넣기 (첨부 파일 업로드 ) by.김성원
	@Override
	public void imageinsert(Map<String, Object> map) throws Exception {
		 sqlSession.insert("BookSellRegistDAO.imageinsert",map);
	}
	
	
	
	

}
