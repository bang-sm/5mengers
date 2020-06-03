package kr.co.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.BookCategoryDTO;
import kr.co.vo.BookDetailDTO;

@Repository
public class BookDetailDAOImpl implements BookDetailDAO{

	@Inject
	private SqlSession sqlSession;
	@Override
	public BookDetailDTO detail() throws Exception{
		// TODO Auto-generated method stub
		System.out.println("확인");
		return sqlSession.selectOne("BookDetailMapper.book_detail");
	}
	@Override
	public BookDetailDTO like() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BookDetailMapper.zzim");
	}
	@Override
	public BookDetailDTO check_on() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BookDetailMapper.check_on");
	}
	@Override
	public BookDetailDTO cheking() throws Exception {
		return sqlSession.selectOne("BookDetailMapper.zzim_check");
	}
	@Override
	public void check_off(int uuid) throws Exception {
		sqlSession.selectOne("BookDetailMapper.check_off",uuid);
		
	}
	@Override
	public void check_on(int uuid, int bsr_id) throws Exception {
		HashMap<String, Integer> hmap=new HashMap<String, Integer>();
		hmap.put("uuid",uuid);
		hmap.put("bsr_id",bsr_id);
		
		sqlSession.selectList("BookDetailMapper.check_on", hmap);
	}
	@Override
	public int check_count(int bsr_id) throws Exception {
		return sqlSession.selectOne("check_count",bsr_id);
	}
	@Override
	public void book_check(int bsr_check,int bsr_id) throws Exception {
		HashMap<String, Integer> cmap=new HashMap<String, Integer>();
		cmap.put("bsr_check",bsr_check);
		cmap.put("bsr_id",bsr_id);
		sqlSession.update("BookDetailMapper.book_check",cmap);
	}
	
	//책 카테고리 리스트
	@Override
	public List<BookCategoryDTO> category() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("BookDetailMapper.bc");
	}
	//메인책리스트
	@Override
	public List<BookCategoryDTO> mainBookList() throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList("BookDetailMapper.main_book_list");
	}

}
