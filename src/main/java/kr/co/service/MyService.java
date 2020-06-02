package kr.co.service;

public interface MyService {
	//찜카운트
	public int zzimCount() throws Exception;
	//판매중인책카운트
	public int sellingBookCount() throws Exception;
	//구매중인책카운트
	public int buyingBookCount() throws Exception;
}
