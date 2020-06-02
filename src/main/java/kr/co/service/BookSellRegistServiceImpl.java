package kr.co.service;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.co.dao.BookSellRegistDAO;
import kr.co.util.FileUtils;
import kr.co.vo.BookSellRegistDTO;

@Service
public class BookSellRegistServiceImpl implements BookSellRegistService{
	
	@Inject
	private BookSellRegistDAO bookSellRegistdao;
	@Inject
	private BookSellRegistDAO dao;
	
	
	@Override
	public void write(BookSellRegistDTO bookSellRegistDTO) throws Exception{
				
		bookSellRegistdao.write(bookSellRegistDTO);
	}
	
	@Resource(name="fileUtils")
	private FileUtils fileUtils;

	//게시글 작성
	@Override
	public void write(BookSellRegistDTO bookSellRegistDTO, MultipartHttpServletRequest mpRequest) throws Exception {
		dao.write(bookSellRegistDTO);
		
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(bookSellRegistDTO, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++) {
			dao.insertFile(list.get(i));
		}
		
	}
	

}

	
	
	
	
