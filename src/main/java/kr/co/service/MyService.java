package kr.co.service;

import java.util.List;
import java.util.Map;

import kr.co.vo.BookDetailDTO;
import kr.co.vo.Criteria;
import kr.co.vo.MyhistoryDTO;

public interface MyService {
	//찜카운트
	public int zzimCount(int uuid) throws Exception;
	//판매중인책카운트
	public int sellingBookCount(int uuid) throws Exception;
	//구매중인책카운트
	public int buyingBookCount(int uuid) throws Exception;
	//현재 판매중인 책 리스트
	public List<BookDetailDTO> sellingBookList(int uuid) throws Exception;
	//현재 찜중인책
	public List<BookDetailDTO> sellingZzimList(int uuid) throws Exception;
	//구매요청중인책리스트
	public List<BookDetailDTO> RequestList(int getuuid) throws Exception;
	//나의 책 구매 히스토리
	public List<MyhistoryDTO> mybookhistory(int uuid,String startDate,String endDate) throws Exception;
	//나의qna리스트
	List<Map<String, Object>> qnaList(Criteria cri);
	//qna리스트 카운트
	public int qnaListCount(int uuid);
	//찜해제
	public void zzimDelete(int bsr_id, int uuid);
	//수락하기
	public void confirm(int bsr_id);
	//판매완료된 리스트
	public List<MyhistoryDTO> mySellhistory(int getuuid, String startDate, String endDate);
	//책 상태 변경
	public void bookStatusChange(int bsr_id, int bsr_status);
	//회원탈퇴 PROTOCOL - 비밀번호 확인
	public void dropUser(String userid) throws Exception;
	
}
