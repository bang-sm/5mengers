package kr.co.dao;

import kr.co.vo.QnADTO;

public interface QnADAO {
	
	// qna 작성
	public void write(QnADTO qnaDTO) throws Exception;
	
	// qna 조회
	public QnADTO read(int qb_id) throws Exception;
	
	// qna 수정
	public void update(QnADTO qnaDTO) throws Exception;
	
	// qna 삭제
	public void delete(int qb_id) throws Exception;
}
