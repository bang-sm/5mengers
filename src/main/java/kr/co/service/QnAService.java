package kr.co.service;

import kr.co.vo.QnADTO;

public interface QnAService {

	// 게시글 작성
		public void write(QnADTO qnaDTO) throws Exception;
		
		// 게시물 조회
		public QnADTO read(int qb_id) throws Exception;

		// 게시물 수정
		public void update(QnADTO qnaDTO) throws Exception;
		
		// 게시물 삭제
		public void delete(int qb_id) throws Exception;
}
