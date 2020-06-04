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
	
	//DB에서 책 관련 값들 가져오기
	@Override
	public BookDetailDTO detail(int bsr_id,int uuid) throws Exception{
		System.out.println("확인");
		HashMap<String, Integer> dmap=new HashMap<String, Integer>();
		dmap.put("bsr_id", bsr_id);
		dmap.put("uuid", uuid);
		
		return sqlSession.selectOne("BookDetailMapper.book_detail",dmap);
	}
	
	//DB에서 찜개수 가져오기
	@Override
	public BookDetailDTO like(int bsr_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BookDetailMapper.zzim",bsr_id);
	}
	
	//사용자 찜 확인
	@Override
	public BookDetailDTO cheking(int bsr_id,int uuid) throws Exception {
		HashMap<String, Integer> chmap=new HashMap<String, Integer>();
		chmap.put("uuid",uuid);
		chmap.put("bsr_id",bsr_id);
		
		return sqlSession.selectOne("BookDetailMapper.zzim_check",chmap);
	}
	
	//찜 등록 해제 AJAX
	@Override
	public void check_off(int uuid,int bsr_id) throws Exception {
		HashMap<String, Integer> chofmap=new HashMap<String, Integer>();
		chofmap.put("uuid",uuid);
		chofmap.put("bsr_id",bsr_id);
		sqlSession.delete("BookDetailMapper.check_off",chofmap);
		
	}
	
	//찜 등록 AJAX
	@Override
	public void check_on(int uuid, int bsr_id) throws Exception {
		HashMap<String, Integer> hmap=new HashMap<String, Integer>();
		hmap.put("uuid",uuid);
		hmap.put("bsr_id",bsr_id);
		
		sqlSession.insert("BookDetailMapper.check_on", hmap);
	}
	
	//찜 개수 AJAX 표현
	@Override
	public int check_count(int bsr_id) throws Exception {
		return sqlSession.selectOne("check_count",bsr_id);
	}
	
	//구매하기 버튼 클릭시 예약중 AJAX
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
		return sqlSession.selectList("BookDetailMapper.bc");
	}
	//메인책리스트
	@Override
	public List<BookCategoryDTO> mainBookList() throws Exception {
		return sqlSession.selectList("BookDetailMapper.main_book_list");
	}
	//책 같은 장르 구현
	@Override
	public List<BookDetailDTO> sidebook(int bsr_category,int bsr_id) throws Exception {
		HashMap<String, Integer> sbmap=new HashMap<String, Integer>();
		sbmap.put("bsr_category", bsr_category);
		sbmap.put("bsr_id", bsr_id);
		
		return sqlSession.selectList("BookDetailMapper.side_same_category",sbmap);
	}

	//글 수정
	@Override
	public List<BookDetailDTO>bookupdate(int bsr_id) throws Exception {
		return sqlSession.selectList("BookDetailMapper.bookupdate",bsr_id);
	}



	

	

}
