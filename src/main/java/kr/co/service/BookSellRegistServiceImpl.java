package kr.co.service;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.UnsupportedEncodingException;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.xmlpull.v1.XmlPullParser;
import org.xmlpull.v1.XmlPullParserException;
import org.xmlpull.v1.XmlPullParserFactory;

import kr.co.dao.BookSellRegistDAO;
import kr.co.util.FileUtils;
import kr.co.vo.BookSellRegistDTO;

@Service
public class BookSellRegistServiceImpl implements BookSellRegistService {

	@Inject
	private BookSellRegistDAO bookSellRegistdao;
	@Inject
	private BookSellRegistDAO dao;

	@Override
	public void write(BookSellRegistDTO bookSellRegistDTO) throws Exception {

		bookSellRegistdao.write(bookSellRegistDTO);
	}

	@Resource(name = "fileUtils")
	private FileUtils fileUtils;

	// 게시글 작성
	@Override
	public void write(BookSellRegistDTO bookSellRegistDTO, MultipartHttpServletRequest mpRequest) throws Exception {
		System.out.println("게시글매소드에 들어옴 1 ");
		dao.write(bookSellRegistDTO);

		System.out.println("게시글매소드에 들어옴 2");
		List<Map<String, Object>> list = fileUtils.parseInsertFileInfo(bookSellRegistDTO, mpRequest);
		int size = list.size();
		for (int i = 0; i < size; i++) {
			System.out.println("게시글매소드포문");
			dao.insertFile(list.get(i));
		}

	}

	// 여기서 부터는 API를 이용해서 데이터 가져오기

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
	

}
