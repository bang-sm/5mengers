package kr.co.dao;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.PopupDTO;


@Repository
public class AdminDAOImpl implements AdminDAO{
	
	@Autowired
	private SqlSession sqlsession;
	
	//팝업등록
	@Override
	public void registPopup(PopupDTO popupDTO) {
		// TODO Auto-generated method stub
		sqlsession.insert("AdminMapper.popup_regist",popupDTO);
	}

}
