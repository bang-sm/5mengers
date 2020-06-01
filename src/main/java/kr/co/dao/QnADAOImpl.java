package kr.co.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import kr.co.vo.QnADTO;

@Repository
public class QnADAOImpl implements QnADAO{
	
	@Inject
	private SqlSession sqlSession;
	
	public void qnAWrite(QnADTO qnADTO) throws Exception{
	}

}