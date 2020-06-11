package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.BookDTO;
import kr.co.vo.BookDetailDTO;
import kr.co.vo.Criteria;
import kr.co.vo.MyhistoryDTO;

public interface MyDAO {
	
	public List<BookDTO> BookRegistList() throws Exception;
	
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
	//구매요청중인책
	public List<BookDetailDTO> RequestList(int uuid) throws Exception;
	//나의 책 구매 히스토리
	public List<MyhistoryDTO> mybookhistory(int uuid,String startDate,String endDate) throws Exception;
	
	public List<Map<String, Object>> qnaList(Criteria cri);
	//qna 리스트 카운트
	public int qnaListCount(int uuid);

	//찜해제
	public void zzimDelete(int bsr_id, int uuid);

	//구매요청한 아이디를 알기위해서
	public int whoAreYou(int bsr_id);
	//구매요청한 아이디의 수락상태 업데이트
	public void buyBookUpdate(int bsr_id, int whoUUid);
	//책 판매했으므로 판매책 상태 업데이트
	public void sellBookUpdate(int bsr_id, int uuid);
	//판매가 완료된 리스트
	public List<MyhistoryDTO> mySellhistory(int getuuid, String startDate, String endDate);
	//책상태변경
	public void bookStatusChange(int bsr_id, int bsr_status);
	//회원탈퇴
	public void dropUser(String userid) throws Exception;
}
