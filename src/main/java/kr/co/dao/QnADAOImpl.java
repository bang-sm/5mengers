package kr.co.dao;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.vo.QnADTO;

@Service
public class QnADAOImpl implements QnADAO{
	
	@Inject
	private QnADAO dao; 
	
	public void qnAWrite(QnADTO qnADTO) throws Exception{
		dao.qnAWrite(qnADTO);
	}

}