package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.MyDAO;
import kr.co.vo.BookDetailDTO;
import kr.co.vo.MyhistoryDTO;
import kr.co.vo.QnADTO;

@Service
public class MyServiceImpl implements MyService{

	@Autowired
	MyDAO dao;
	
	//찜카운트
	@Override
	public int zzimCount(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return dao.zzimCount(uuid);
	}
	
	//판매중인책카운트
	@Override
	public int sellingBookCount(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return dao.sellingBookCount(uuid);
	}

	@Override
	public int buyingBookCount(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return dao.buyingBookCount(uuid);
	}
	
	//판매중인책 리스트
	@Override
	public List<BookDetailDTO> sellingBookList(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return dao.sellingBookList(uuid);
	}
	//찜중인책리스트
	@Override
	public List<BookDetailDTO> sellingZzimList(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return dao.sellingZzimList(uuid);
	}
	//구매요청중인책리스트
	@Override
	public List<BookDetailDTO> RequestList(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return dao.RequestList(uuid);
	}
	//나의 구매책 히스토리
	@Override
	public List<MyhistoryDTO> mybookhistory(int uuid) throws Exception {
		// TODO Auto-generated method stub
		return dao.mybookhistory(uuid);
	}

	@Override
	public List<QnADTO> qnaList(int uuid) {
		// TODO Auto-generated method stub
		return dao.qnaList(uuid);
	}

}
