package kr.co.dao;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BookSellRegistDTO;


@Repository
public class BookSellRegistDAOImpl implements BookSellRegistDAO {
	@Inject
	private SqlSession sqlSession;

	
	int bsr_id;
	int uuid;
	String bsr_name;
	String bsr_price;
	@Override
	public void write(BookSellRegistDTO bookSellRegistDTO) throws Exception {
		sqlSession.insert("BookSellRegistMapper.book_sell_registMapper", bookSellRegistDTO);
		uuid = bookSellRegistDTO.getUuid();
		bsr_name = bookSellRegistDTO.getBsr_name();
		bsr_price = bookSellRegistDTO.getBsr_price();
		HashMap<String,String> bsrmp = new HashMap<String, String>();
		bsrmp.put("uuid", Integer.toString(uuid));
		bsrmp.put("bsr_name", bsr_name);
		bsrmp.put("bsr_price", bsr_price);
		
		bsr_id = sqlSession.selectOne("BookSellRegistMapper.bsr_id",bsrmp);
		
		
	}

	@Override
	public void insertFile(Map<String, Object> map) throws Exception{
		map.put("bsr_id",bsr_id);
		sqlSession.insert("BookSellRegistMapper.insertFile", map);
		
	}

	//수정된 db 값 넣기(파일 제외 나머지 ) by.김성원
	@Override
	public void detailupdate(BookSellRegistDTO bookSellRegistDTO) throws Exception {
		
		sqlSession.update("BookSellRegistMapper.detailupdate",bookSellRegistDTO);
		
	}

	//수정된 db 값 넣기 (첨부 파일 업로드 ) by.김성원
	@Override
	public void imageinsert(Map<String, Object> map) throws Exception {
		 sqlSession.insert("BookSellRegistMapper.imageinsert",map);
	}
	
	
	
	

}
