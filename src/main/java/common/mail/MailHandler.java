package common.mail;

import java.io.UnsupportedEncodingException;

import javax.activation.DataSource;
import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

public class MailHandler {
	private JavaMailSender mailsender;
	private MimeMessage msg;
	private MimeMessageHelper msgHelper;
	
	public MailHandler(JavaMailSender mailSender) throws MessagingException {
		this.mailsender = mailSender;
		msg = this.mailsender.createMimeMessage();
		msgHelper = new MimeMessageHelper(msg, true, "utf-8");
	}
	
	// 이메일 제목 (Title)
	public void setSubject(String subject) throws MessagingException {
		msgHelper.setSubject(subject);
	}
	
	// 이메일 내용 (context) - text
	public void setContext(String context) throws MessagingException {
		msgHelper.setText(context, true); // html 형식이면 boolean type true
	}
	
	// 발송자 정보 ( Sender Info)
	public void setFrom(String email , String name) throws MessagingException, UnsupportedEncodingException {
		msgHelper.setFrom(email, name);
	}
	
	// 수신자 정보 (Recipient Info)
	public void setTo(String email) throws MessagingException {
		msgHelper.setTo(email);
	}
	
	public void addInline(String contentId, DataSource dataSource ) throws MessagingException {
		msgHelper.addInline(contentId, dataSource);
	}
	
	public void send() {
		try {
			mailsender.send(msg);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
} // end MailHandler
