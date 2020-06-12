package kr.co.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.vo.Criteria;
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
	//유저들의 총qna카운트
	@Override
	public int userqnaListCount() {
		// TODO Auto-generated method stub
		return sqlsession.selectOne("AdminMapper.userqnaListCount");
	}
	
	//유저들의 qna리스트
	@Override
	public List<Map<String, Object>> userQnaList(Criteria cri) {
		// TODO Auto-generated method stub
		return sqlsession.selectList("AdminMapper.userqnalist",cri);
	}

}
