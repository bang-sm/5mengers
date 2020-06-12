package kr.co.service;

import java.util.List;
import java.util.Map;

import kr.co.vo.Criteria;
import kr.co.vo.PopupDTO;

public interface AdminService {

	//팝업등록
	public void registPopup(PopupDTO popupDTO) throws Exception;
	//디비 팝업 체크
	public List<PopupDTO> popupList();
	//팝업상태변경
	public void popup_status_update(PopupDTO popupDTO);
	//팝업삭제
	public void popupDelete(int np_id);
	
	//유저들의 qna리스트
	public List<Map<String, Object>> userQnaList(Criteria cri);
	//유저qna카운트
	public int userqnaListCount();
}
