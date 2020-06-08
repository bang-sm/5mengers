package kr.co.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.dao.AdminDAO;
import kr.co.vo.PopupDTO;

@Service
public class AdminServiceImpl implements AdminService{
	@Autowired
	private AdminDAO adminDAO;
	//팝업창 등록!!
	@Override
	public void registPopup(PopupDTO popupDTO) throws Exception {
		// TODO Auto-generated method stub
		adminDAO.registPopup(popupDTO);
	}
	
	//디비팝업창리스트체크
	@Override
	public List<PopupDTO> popupList() {
		// TODO Auto-generated method stub
		return adminDAO.popupList();
	}

	@Override
	public void popup_status_update(PopupDTO popupDTO) {
		// TODO Auto-generated method stub
		adminDAO.popup_status_update(popupDTO);
	}

	@Override
	public void popupDelete(int np_id) {
		// TODO Auto-generated method stub
		adminDAO.popup_delete(np_id);
	}

}
