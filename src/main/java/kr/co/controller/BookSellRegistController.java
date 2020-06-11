package kr.co.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Properties;

import javax.inject.Inject;

import org.json.simple.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

import kr.co.service.BookSellRegistService;
import kr.co.vo.BookSellRegistDTO;

@Controller
public class BookSellRegistController {
	
	   protected static String FTP_IP   = "123.142.55.115"; // FTP 접속지 IP
	   protected static int    FTP_PORT = 22;             // FTP 접속지 Port
	   protected static String FTP_ID   = "gksfk6165";        // ID
	   protected static String FTP_PWD  = "dhaoswutm!@";        // PASSWORD
	   protected static String FTP_PATH = "";
	   ChannelSftp chSftp               = null;
	   FileInputStream fi               = null;
	
	   @RequestMapping(value = "/upload/connectFtp", method=RequestMethod.GET)
	   public String connectFtp() {
	     
	      // FTP 관련 객체 선언
	      Session ses = null;             // 접속계정
	      Channel ch  = null;             // 접속
	      JSch jsch   = new JSch();       // jsch 객체를 생성
	     
	      try {
	         // 세션 객체를 생성(사용자 이름, 접속할 호스트, 포트)
	         ses = jsch.getSession(FTP_ID, FTP_IP, FTP_PORT);
	         
	         // 비밀번호 설정
	         ses.setPassword(FTP_PWD);
	         
	         // 세션과 관련된 정보를 설정
	         Properties p = new Properties();
	        
	         // 호스트 정보를 검사하지 않음
	         p.put("StrictHostKeyChecking", "no");
	         ses.setConfig(p);
	        
	         System.out.println("연결중");
	         
	         // 접속
	         ses.connect();        
	 
	         // 채널을 오픈(sftp)
	         ch = ses.openChannel("sftp");
	         
	         // 채널에 연결(sftp)        
	         ch.connect();        
	           
	         // 채널을 FTP용 채널 객체로 개스팅
	         chSftp = (ChannelSftp)ch;     
	        
	         System.out.println("FTP 연결이 되었습니다.");
	      } catch(Exception e) {
	         e.printStackTrace();
	         System.out.println("FTP 연결에 실패했습니다.");
	         return "redirect:/upload/uploadForm";
	      }
	      return "/home";
	   }
	 
	   @RequestMapping(value = "/upload/disconnectFtp", method=RequestMethod.GET)
	   public String disconnectFtp() {
	     
	      try {
	         chSftp.quit();                            // Sftp 연결 종료
	         System.out.println("FTP 연결을 종료합니다.");
	      } catch(Exception e) { 
	         System.err.println(e.getMessage());
	      }
	  
	      return "redirect:/upload/uploadForm";
	   }
	  
	   @RequestMapping(value = "/upload/uploadFtp", method=RequestMethod.GET)
	   public String uploadFtp() {
	     
	      String filePath = "C:\\bookimg\\";     // 나중에 DB에서 필요한 경로 당기면 good
	      
	      File file= new File(filePath);       // file 객체 생성 (파일 경로 입력)
	      try {
	         fi = new FileInputStream(file);
	         chSftp.cd("/");                   // 서버의 경로
	         chSftp.put(fi, file.getName());   // 서버에 파일 보내기
	      } catch(SftpException e) { 
	         e.printStackTrace();
	      } catch(FileNotFoundException e) {
	         e.printStackTrace();
	      } finally {
	         try {
	            fi.close();
	         } catch (IOException e) {
	            e.printStackTrace();
	         }
	      }
	      return "redirect:/home";
	   }  
	
	
	
	private static final Logger logger = LoggerFactory.getLogger(BookSellRegistController.class);
	
	@Inject
	BookSellRegistService service;
	
	
	//게시판 글 작성 화면
	@RequestMapping(value = "/booksellregist", method = RequestMethod.GET)
	public String writeView() throws Exception {
		logger.info("booksellregist");
		
		return "/booksellregist/booksellregistPage";
	}
	
	//게시판 글 작성
	
	@RequestMapping(value = "/booksellregistPage", method = RequestMethod.POST)
	// DTO로 보내서 DB에 저장한다 									// 첨부 파일의 파라미터값을 받음
	public String write(BookSellRegistDTO bookSellRegistDTO, MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("booksellregistPage");
		
		logger.info(bookSellRegistDTO.getBsr_name());
		
		service.write(bookSellRegistDTO, mpRequest);
		// 데이터 전송 후 보여줄 page를 return함(현재페이지를 새로고침함)
			return "redirect:/";
	}
	
	
	
	//수정 페이지 에서 사진첨부 insert by.김성원
	@RequestMapping(value ="/bookupdate_end", method = RequestMethod.POST)
	public String imageinsert(BookSellRegistDTO bookSellRegistDTO, MultipartHttpServletRequest mpRequest) throws Exception{
		logger.info("수정된 값 DB넣기 by.김성원");
		service.imageinsert(bookSellRegistDTO,mpRequest);
		
		
		return "redirect:/";
	}

	
	
	//bookapi 페이지
		@RequestMapping(value ="/booksellregistapi",method =RequestMethod.GET)
		public String bookapi() throws Exception{
			logger.info("책 목록");
			return "booksellregist/booksellregistPage";
		}
	
	
	//네이버 책 ajax
	
	@ResponseBody
	@RequestMapping(value ="/booksellregistajax",method =RequestMethod.GET)
	public JSONObject bookapicheck(String keyword) throws Exception{
		logger.info("책 목록");
		logger.info("머가 오지: "+service.bookapi(keyword));
		return service.bookapi(keyword);
	}
	
	//지도 연습입니당
		@RequestMapping(value ="/booksellregistmap",method =RequestMethod.GET)
		public String bookupdate(Model model) throws Exception{
			logger.info("지도 연습");
			return "booksellregist/booksellregistPage";
		}
	
	
	
	
	
	
	
}
