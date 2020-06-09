package kr.co.dao;

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
	public QnADTO read(int qb_id) throws Exception {
		return sqlSession.selectOne("QnAMapper.read", qb_id);
	}
	
	@Override
	public void update(QnADTO qnaDTO) throws Exception {
		sqlSession.update("QnAMapper.update", qnaDTO);		
	}
	
	@Override
	public void delete(int qb_id) throws Exception {
		sqlSession.delete("QnAMapper.delete", qb_id);		
	}

}