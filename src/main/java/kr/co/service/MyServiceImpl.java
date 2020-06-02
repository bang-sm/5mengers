package kr.co.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.MyDAO;

@Service
public class MyServiceImpl implements MyService{

	@Autowired
	MyDAO dao;
	
	//찜카운트
	@Override
	public int zzimCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.zzimCount();
	}
	
	//판매중인책카운트
	@Override
	public int sellingBookCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.sellingBookCount();
	}

	@Override
	public int buyingBookCount() throws Exception {
		// TODO Auto-generated method stub
		return dao.buyingBookCount();
	}

}
