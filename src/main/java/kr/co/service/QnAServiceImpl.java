package kr.co.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import kr.co.dao.QnADAO;
import kr.co.vo.QnADTO;

@Service
public class QnAServiceImpl implements QnAService {

	@Inject
	private QnADAO dao;
	
	// 게시물 작성
	@Override
	public void write(QnADTO qnaDTO) throws Exception {
		dao.write(qnaDTO);		
	}
}
