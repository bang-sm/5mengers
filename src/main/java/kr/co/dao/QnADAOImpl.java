package kr.co.dao;

import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import kr.co.vo.QnADTO;

@Repository
public class QnADAOImpl implements QnADAO{
	
	@Inject
	private SqlSession sqlSession;
	
	@Override
	public void write(QnADTO qnaDTO) throws Exception {
		sqlSession.insert("QnAMapper.insert", qnaDTO);
	}
	
	@Override
	public List<QnADTO> list() throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public QnADTO read(int qb_id) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}
	
	@Override
	public void update(QnADTO qnaDTO) throws Exception {
		// TODO Auto-generated method stub
		
	}
	
	@Override
	public void delete(int qb_id) throws Exception {
		// TODO Auto-generated method stub
		
	}

}