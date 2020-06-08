package kr.co.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.vo.BookCategoryDTO;
import kr.co.vo.BookDetailDTO;

@Repository
public class BookDetailDAOImpl implements BookDetailDAO {

	@Inject
	private SqlSession sqlSession;

	// DB에서 책 관련 값들 가져오기
	@Override
	public BookDetailDTO detail(int bsr_id, int uuid) throws Exception {
		System.out.println("확인");
		HashMap<String, Integer> dmap = new HashMap<String, Integer>();
		dmap.put("bsr_id",bsr_id);
		dmap.put("uuid",uuid);
        System.out.println(dmap);
		return sqlSession.selectOne("BookDetailMapper.book_detail", dmap);
	}

	// DB에서 찜개수 가져오기
	@Override
	public BookDetailDTO like(int bsr_id) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("BookDetailMapper.zzim", bsr_id);
	}

	// 사용자 찜 확인
	@Override
	public BookDetailDTO cheking(int bsr_id, int uuid) throws Exception {
		HashMap<String, Integer> chmap = new HashMap<String, Integer>();
		chmap.put("uuid", uuid);
		chmap.put("bsr_id", bsr_id);

		return sqlSession.selectOne("BookDetailMapper.zzim_check", chmap);
	}

	// 찜 등록 해제 AJAX
	@Override
	public void check_off(int uuid, int bsr_id) throws Exception {
		HashMap<String, Integer> chofmap = new HashMap<String, Integer>();
		chofmap.put("uuid", uuid);
		chofmap.put("bsr_id", bsr_id);
		sqlSession.delete("BookDetailMapper.check_off", chofmap);

	}

	// 찜 등록 AJAX
	@Override
	public void check_on(int uuid, int bsr_id) throws Exception {
		System.out.println("찜등록 매개변수uuid   "+uuid);
		System.out.println("찜등록 매개변수bsr_id  "+bsr_id);
		HashMap<String, Integer> hmap = new HashMap<String, Integer>();
		hmap.put("uuid", uuid);
		hmap.put("bsr_id", bsr_id);

		sqlSession.insert("BookDetailMapper.check_on", hmap);
	}
	// 찜 개수 AJAX 표현
	@Override
	public int check_count(int bsr_id) throws Exception {
		return sqlSession.selectOne("check_count", bsr_id);
	}

	// 구매하기 버튼 클릭시 예약중 AJAX
	@Transactional
	@Override
	public int book_check(int bsr_check, int bsr_id) throws Exception {
		int count;

		try {
			int check = sqlSession.selectOne("BookDetailMapper.book_update_check", bsr_id);
			System.out.println("check : " + check);
			HashMap<String, Integer> cmap = new HashMap<String, Integer>();
			cmap.put("bsr_check", bsr_check);
			cmap.put("bsr_id", bsr_id);
			sqlSession.update("BookDetailMapper.book_check", cmap);
			count = 0;
			
		} catch (NullPointerException e) {
			System.out.println("수리중");
			count =1;
		}
		return count;

	}

	// 책 카테고리 리스트
	@Override
	public List<BookCategoryDTO> category() throws Exception {
		return sqlSession.selectList("BookDetailMapper.bc");
	}

	// 메인책리스트
	@Override
	public List<BookCategoryDTO> mainBookList() throws Exception {
		return sqlSession.selectList("BookDetailMapper.main_book_list");
	}

	// 책 같은 장르 구현
	@Override
	public List<BookDetailDTO> sidebook(int bsr_category, int bsr_id) throws Exception {
		HashMap<String, Integer> sbmap = new HashMap<String, Integer>();
		sbmap.put("bsr_category", bsr_category);
		sbmap.put("bsr_id", bsr_id);

		return sqlSession.selectList("BookDetailMapper.side_same_category", sbmap);
	}

	// 글 수정 DB 값 가져와서 표출
	@Override
	public List<BookDetailDTO> bookupdate(int bsr_id) throws Exception {
		return sqlSession.selectList("BookDetailMapper.bookupdate", bsr_id);
	}

	// 글 수정 DB 값 넣기
	@Override
	public void bookupdateend(BookDetailDTO bookDetailDTO) throws Exception {
		sqlSession.update("BookDetailMapper.bookupdateend", bookDetailDTO);
	}

	// 글 삭제
	@Override
	public void book_delete(int bsr_id) throws Exception {
		sqlSession.delete("BookDetailMapper.bookdelete", bsr_id);
	}

	// 글 수정버튼 클릭시 db(bsr_update) 값 변경
	@Override
	public void bookupdatecheck(int bsr_id) throws Exception {
		sqlSession.update("BookDetailMapper.bookupdatecheck", bsr_id);
	}

	@Override
	public void bookupdatecheckout(int bsr_id) throws Exception {
		sqlSession.update("BookDetailMapper.bookupdatecheckout", bsr_id);

	}
	
	//구매하기시 구매자 DB 상태 업데이트   by-방석민
	@Override
	public void buying_book(int uuid, int bsr_id) throws Exception {
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("uuid", uuid);
		map.put("bsr_id", bsr_id);
		sqlSession.insert("BookDetailMapper.buying_book",map);
	}

	//상세페이지 접속시 bsr_status 는 비활성화
	@Override
	public void bsrstatusbook(int bsr_id) throws Exception {
		sqlSession.update("BookDetailMapper.bsrstatusbook",bsr_id);
		
	}

}
