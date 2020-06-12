package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.BookRequestDAO;
import kr.co.vo.BookDetailDTO;
import kr.co.vo.BookRequestDTO;
import kr.co.vo.Criteria;
import kr.co.vo.UserVO;

@Service
public class BookRequestServiceImpl implements BookRequestService {
	
	@Inject
	private BookRequestDAO dao;
	
	@Override
	public void write(BookRequestDTO bRequestDTO) throws Exception {
		dao.Write(bRequestDTO);
	}

	@Override
	public List<BookRequestDTO> list(Criteria cri) throws Exception {
		return dao.list(cri);
	}
	
	// 작성자 userid 가져오기
	@Override
	public UserVO userid(int brb_id) {
		return dao.userid(brb_id);
	}
	
	@Override
	public int brbListCount() {
		return dao.brbListCount();
}
	public BookRequestDTO read(int brb_id) throws Exception {
		return dao.read(brb_id);
	}
	
	@Override
	public void update(BookRequestDTO bRequestDTO) throws Exception {

		dao.update(bRequestDTO);
	}
	
	@Override
	public void delete(int brb_id) throws Exception {

		dao.delete(brb_id);
	}
	
	@Override
	public void replyWrite(BookRequestDTO bRequestDTO) throws Exception {
		dao.replyWrite(bRequestDTO);
		
	}
	// 댓글 삭제
	@Override
	public void replyDelete(int brb_id) throws Exception {
		dao.replyDelete(brb_id);
	}
	
	@Override
	public List<BookRequestDTO> replyRead(int brb_id) throws Exception {
		return dao.replyRead(brb_id);
	}
	

	//내가 팔고있는 나의 책 리스트
	@Override
	public List<BookDetailDTO> myBuyingBookList(int uuid) {
		return dao.myBuyingBookList(uuid);
	}
	
	@Override
	public BookRequestDTO category(int brb_id) throws Exception {
		return dao.category(brb_id);
	}
}
