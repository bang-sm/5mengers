package kr.co.dao;

import java.util.List;
import java.util.Map;

import kr.co.vo.Criteria;
import kr.co.vo.PopupDTO;

public interface AdminDAO {
	
	//팝업등록
	public void registPopup(PopupDTO popupDTO);
	//디비 팝업 체크
	public List<PopupDTO> popupList();
	//팝업상태변경
	public void popup_status_update(PopupDTO popupDTO);
	//팝업삭제
	public void popup_delete(int np_id);
	//유저 qna총 카운트
	public int userqnaListCount();
	//유저들의 qna리스트
	public List<Map<String, Object>> userQnaList(Criteria cri);
}
