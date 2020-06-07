package kr.co.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.fasterxml.jackson.databind.util.JSONPObject;

import kr.co.dao.BookDetailDAO;
import kr.co.vo.BookCategoryDTO;
import kr.co.vo.BookDetailDTO;

@Service
public class BookDetailServiceImpl implements BookDetailService {

	@Inject
	private BookDetailDAO dao;

	// DB에서 책 관련 값들 가져오기
	@Override
	public BookDetailDTO detail(int bsr_id, int uuid) throws Exception {
		// TODO Auto-generated method stub
		return dao.detail(bsr_id, uuid);
	}

	// DB에서 찜개수 가져오기
	@Override
	public BookDetailDTO like(int bsr_id) throws Exception {
		// TODO Auto-generated method stub
		return dao.like(bsr_id);
	}

	// 사용자 찜 확인
	@Override
	public BookDetailDTO cheking(int bsr_id, int uuid) throws Exception {
		return dao.cheking(bsr_id, uuid);
	}

	// 찜 등록 해제 AJAX
	@Override
	public void check_off(int uuid, int bsr_id) throws Exception {
		dao.check_off(uuid, bsr_id);

	}

	// 찜 등록 AJAX
	@Override
	public void check_on(int uuid, int bsr_id) throws Exception {
		dao.check_on(uuid, bsr_id);
	}

	// 찜 개수 AJAX 표현
	@Override
	public int check_count(int bsr_id) throws Exception {
		return dao.check_count(bsr_id);
	}

	// 구매하기 버튼 클릭시 예약중 AJAX
	@Override
	public int book_check(int bsr_check, int bsr_id) throws Exception {
		return dao.book_check(bsr_check, bsr_id);
	}

	// 책 카테고리 리스트
	@Override
	public List<BookCategoryDTO> category() throws Exception {
		// TODO Auto-generated method stub
		return dao.category();
	}

	// 메인책리스트
	@Override
	public List<BookCategoryDTO> mainBookList() throws Exception {
		// TODO Auto-generated method stub
		return dao.mainBookList();
	}

	// 책 같은 장르 구현
	@Override
	public List<BookDetailDTO> sidebook(int bsr_category, int bsr_id) throws Exception {
		return dao.sidebook(bsr_category, bsr_id);
	}

	// 글 수정 DB 값 가져와서 표출
	@Override
	public List<BookDetailDTO> bookupdate(int bsr_id) throws Exception {
		return dao.bookupdate(bsr_id);
	}

	// 글 수정 DB 값 넣기
	@Override
	public void bookupdateend(BookDetailDTO bookDetailDTO) throws Exception {
		dao.bookupdateend(bookDetailDTO);
	}

	// 글 삭제
	@Override
	public void book_delete(int bsr_id) throws Exception {
		dao.book_delete(bsr_id);
	}

	// 네이버 책
	@Override
	public JSONObject bookapi(String keyword) throws Exception {
		String clientId = "SCrW8Vqyf_Whz991VMq5";
		String clientSecret = "Xyeh7whQVZ";
		StringBuffer response = null;

		try {
			String end = URLEncoder.encode(keyword, "UTF-8");
			String apiURL = String.format("https://openapi.naver.com/v1/search/book.json?query=%s&display=100&start=1",
					end);
			URL url = new URL(apiURL);
			HttpURLConnection con = (HttpURLConnection) url.openConnection();
			con.setRequestMethod("GET");
			con.setRequestProperty("X-Naver-Client-Id", clientId);
			con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
			// post request
			con.setDoOutput(true);
			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200) { // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else { // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}
			String inputLine;
			response = new StringBuffer();
			while ((inputLine = br.readLine()) != null) {
				response.append(inputLine);
			}
			br.close();
		} catch (Exception e) {
			System.out.println(e);
		}

		JSONParser parser = new JSONParser();
		Object obj = parser.parse(response.toString());
		JSONObject jsonObj = (JSONObject) obj;

		return jsonObj;

	}

	// 글 수정버튼 클릭시 db(bsr_update) 값 변경

	@Override
	public void bookupdatecheck(int bsr_id) throws Exception {
		dao.bookupdatecheck(bsr_id);

	}

	@Override
	public void bookupdatecheckout(int bsr_id) throws Exception {
		dao.bookupdatecheckout(bsr_id);

	}

}
