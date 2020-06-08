package kr.co.service;

import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.springframework.stereotype.Service;

import kr.co.dao.BookRequestDAO;
import kr.co.vo.BookRequestDTO;

@Service
public class BookRequestServiceImpl implements BookRequestService {
	
	@Inject
	private BookRequestDAO dao;
	
	@Override
	public void write(BookRequestDTO bRequestDTO) throws Exception {
		dao.Write(bRequestDTO);
	}

	@Override
	public List<BookRequestDTO> list() throws Exception {
		return dao.list();
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
	public void search(JSONObject keyword) throws Exception {
		//TODO JSON으로 받아서 필요한 Property 가져와서 리턴?
		
	}
}
