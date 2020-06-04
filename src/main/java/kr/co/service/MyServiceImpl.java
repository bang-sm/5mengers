package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.MyDAO;
import kr.co.vo.BookDetailDTO;

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

}
