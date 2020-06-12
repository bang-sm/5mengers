package kr.co.dao;


import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONObject;
import org.springframework.stereotype.Repository;

import kr.co.vo.BookDetailDTO;
import kr.co.vo.BookRequestDTO;
import kr.co.vo.Criteria;
import kr.co.vo.UserVO;

@Repository
public class BookRequestDAOImpl implements BookRequestDAO {
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void Write(BookRequestDTO bRequestDTO) throws Exception {
		
		sqlSession.insert("bookRequestMapper.insert", bRequestDTO);
	}
	
	// 게시물 목록 조회
	@Override
	public List<BookRequestDTO> list(Criteria cri) throws Exception {

		return sqlSession.selectList("bookRequestMapper.list",cri);
	}
	
	// 작성자 userid 가져오기
	@Override
	public UserVO userid(int brb_id) {
		return sqlSession.selectOne("bookRequestMapper.userid", brb_id);
	}
	
	// 구매 요청 게시물 총 갯수
	@Override
	public int brbListCount() {
		
		return sqlSession.selectOne("bookRequestMapper.list_count");
	}
	// 게시물 조회
	@Override
	public BookRequestDTO read(int brb_id) throws Exception {
		
		return sqlSession.selectOne("bookRequestMapper.read", brb_id);
	}
	
	@Override
	public void update(BookRequestDTO bRequestDTO) throws Exception {

		sqlSession.update("bookRequestMapper.update", bRequestDTO);
	}
	
	@Override
	public void delete(int brb_id) throws Exception {

		sqlSession.delete("bookRequestMapper.delete", brb_id);
	}
	
	@Override
	public List<BookRequestDTO> replyRead(int brb_id) throws Exception {
		
		return sqlSession.selectList("bookRequestMapper.replyRead", brb_id);
	}
	
	@Override
	public void replyWrite(BookRequestDTO bRequestDTO) throws Exception {
		
		sqlSession.insert("bookRequestMapper.replyWrite", bRequestDTO);
	}
	
	@Override
	public void replyDelete(int brbr_id) throws Exception {
		
		sqlSession.delete("bookRequestMapper.replyDelete", brbr_id);
	}
	
	@Override
	public void search(JSONObject keyword) throws Exception {
		
	}

	//나의 판매중 책 리스트
	@Override
	public List<BookDetailDTO> myBuyingBookList(int uuid) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("bookRequestMapper.myBuyingBookList", uuid);
	}
	
	@Override
	public BookRequestDTO category(int brb_id) throws Exception {
		return sqlSession.selectOne("bookRequestMapper.category", brb_id);
	}
}
