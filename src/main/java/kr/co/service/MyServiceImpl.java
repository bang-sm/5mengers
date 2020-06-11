package kr.co.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.MyDAO;
import kr.co.vo.BookDetailDTO;
import kr.co.vo.Criteria;
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
	public List<MyhistoryDTO> mybookhistory(int uuid,String startDate,String endDate) throws Exception {
		// TODO Auto-generated method stub
		return dao.mybookhistory(uuid,startDate,endDate);
	}


	@Override
	public int qnaListCount(int uuid) {
		// TODO Auto-generated method stub
		return dao.qnaListCount(uuid);
	}
	
    //나의 qna리스트
	@Override
	public List<Map<String, Object>> qnaList(Criteria cri) {
		// TODO Auto-generated method stub
		return dao.qnaList(cri);
	}

	//찜해제
	@Override
	public void zzimDelete(int bsr_id, int uuid) {
		// TODO Auto-generated method stub
		dao.zzimDelete(bsr_id,uuid);
	}

	@Override
	public void confirm(int bsr_id, int uuid) {
		// 구매요청한 유저가 누구인지 알아오기
		int whoUUid=dao.whoAreYou(bsr_id);
		//그 유저 mybuybook 책값 구매요청한아이디 이용하여 컬럼 업데이트 상태 Y로 바꿔주기
		dao.buyBookUpdate(bsr_id,whoUUid);
		//판매된 책도 바꿔주기
		dao.sellBookUpdate(bsr_id,uuid);
	}

	//판매 완료된 리스트
	@Override
	public List<MyhistoryDTO> mySellhistory(int getuuid, String startDate, String endDate) {
		// TODO Auto-generated method stub
		return dao.mySellhistory(getuuid,startDate,endDate);
	}
	
	// 회원탈퇴 프로토콜 
	@Override
	public void dropUser(String userid) throws Exception {
		
		dao.dropUser(userid);
	}

	@Override
	public void bookStatusChange(int bsr_id, int bsr_status) {
		dao.bookStatusChange(bsr_id,bsr_status);
		
	}

}
