package kr.co.dao;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.vo.BookRequestDTO;

@Service
public class BookRequestDAOImpl implements BookRequestDAO {
	
	@Inject
	private BookRequestDAO dao;
	
	@Override
	public void bRWrite(BookRequestDTO bRequestDTO) throws Exception {
			dao.bRWrite(bRequestDTO);	
		
	}
}
