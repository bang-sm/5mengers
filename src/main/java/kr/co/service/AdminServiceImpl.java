package kr.co.service;

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

}
