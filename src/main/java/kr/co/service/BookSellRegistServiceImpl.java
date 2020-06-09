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
		System.out.println("게시글매소드에 들어옴 1 ");
		dao.write(bookSellRegistDTO);
		
		System.out.println("게시글매소드에 들어옴 2");
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(bookSellRegistDTO, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++) {
			System.out.println("게시글매소드포문");
			dao.insertFile(list.get(i));
		}
		
	}

	//수정된 db값 넣기 by.김성원
	@Override
	public void imageinsert(BookSellRegistDTO bookSellRegistDTO, MultipartHttpServletRequest mpRequest)throws Exception {
		System.out.println("게시글매소드에 들어옴 1 ");
		dao.detailupdate(bookSellRegistDTO);
		
		System.out.println("게시글매소드에 들어옴 2");
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(bookSellRegistDTO, mpRequest);
		int size = list.size();
		for(int i=0; i<size; i++) {
			System.out.println("게시글매소드포문");
			dao.imageinsert(list.get(i));
		}
	

}
}

	
	
	
	
