package kr.co.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.PopupDTO;
import kr.co.vo.QnADTO;


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
	//디비 팝업리스트 확인
	@Override
	public List<PopupDTO> popupList() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("AdminMapper.popup_check");
	}
	//팝업상태변경
	@Override
	public void popup_status_update(PopupDTO popupDTO) {
		// TODO Auto-generated method stub
		sqlsession.update("AdminMapper.popup_status_update",popupDTO);
	}
	@Override
	public void popup_delete(int np_id) {
		// TODO Auto-generated method stub
		sqlsession.delete("AdminMapper.popup_delete",np_id);
	}
	@Override
	public List<QnADTO> userQnaList() {
		// TODO Auto-generated method stub
		return sqlsession.selectList("AdminMapper.userqnalist");
	}

}
