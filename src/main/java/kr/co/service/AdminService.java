package kr.co.service;

import java.util.List;

import kr.co.vo.PopupDTO;

public interface AdminService {

	//팝업등록
	public void registPopup(PopupDTO popupDTO) throws Exception;
	//디비 팝업 체크
	public List<PopupDTO> popupList();
	//팝업상태변경
	public void popup_status_update(PopupDTO popupDTO);
}
