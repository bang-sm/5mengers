package kr.co.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import kr.co.vo.BookSellRegistDTO;

@Component("fileUtils")

// 첨부파일의 정보를 이용하여 여러 조작을 할 클래스 
public class FileUtils {


	@Autowired
	HttpSession session;
	
	public List<Map<String, Object>> parseInsertFileInfo(BookSellRegistDTO bookSellRegistDTO,
			MultipartHttpServletRequest mpRequest) throws Exception{
		// 데이터들의 집합체에서 컬렉션으로부터 정보를 얻어올 수 있는 인터페이스 ??????????
		
		Iterator<String> iterator = mpRequest.getFileNames();
		
		
		MultipartFile multipartFile = null;
		String originalFileName = null;
		String originalFileExtension = null;
		String storedFileName = null;
		String bi_root = null;
		
		
		List<Map<String, Object>> list = new ArrayList<Map<String,Object>>();
		Map<String, Object> listMap = null;
		
		int bsr_id = bookSellRegistDTO.getBsr_id(); // Bsr_id 값을 bsr_id에 담는다 
		
		String filePath=session.getServletContext().getRealPath("/");
		
		
		File file = new File(filePath);
		if(file.exists() == false) {
			file.mkdirs();
		} // filePath에 file이 존재하지 않는 경우 위 경로에 디렉토리 생성
		
		// list화 된 map을 차례로 뽑아준다. 
		while(iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if(multipartFile.isEmpty() == false) {
				originalFileName = multipartFile.getOriginalFilename(); // 파일의 원래 이름을 저장
				originalFileExtension = originalFileName.substring(originalFileName.lastIndexOf(".")); // 파일명의 확장자명을 받아온다. 
				storedFileName = getRandomString() + originalFileExtension;
				
				file = new File(filePath + storedFileName);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("bi_user_file_name", originalFileName); 
				listMap.put("bi_file_name", storedFileName);
				listMap.put("bi_root",filePath);
				listMap.put("bsr_id", bsr_id);

				list.add(listMap);
				
				System.out.println(list);
			}
		}
	
		
		return list;
		
	}
	
	// 32글자의 랜덤한 문자열(숫자 포함)을 만들어 반환해준다. 
	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}
}
		
		
		
		
		
		
		
		
		
		
		
	