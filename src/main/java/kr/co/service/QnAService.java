package kr.co.service;

import kr.co.vo.QnADTO;

public interface QnAService {

	// 게시글 작성
	public void write(QnADTO qnaDTO) throws Exception;
}
