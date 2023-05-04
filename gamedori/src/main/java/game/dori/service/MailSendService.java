package game.dori.service;

import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service
public class MailSendService {
	@Autowired
	private JavaMailSenderImpl mailSender;
		

	public void sendVerificationEmail(String recipientEmail, String token) {
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message);

	    try {
	        helper.setTo(recipientEmail);
	        helper.setSubject("이메일 인증");

	        // 이메일 인증 링크에 email과 token 파라미터 추가
	       // String verificationLink = "http://localhost:8156/gamedori/user/emailCheck.do?email=" + recipientEmail + "&token=" + token;
	        String verificationLink = "http://jjezen.cafe24.com/gamedori/user/emailCheck.do?email=" + recipientEmail + "&token=" + token;

	        // 메일 내용 설정
	        String mailContent = "회원가입을 완료하려면 아래 링크를 클릭하세요.:\n\n" + verificationLink;
	        helper.setText(mailContent); // 수정된 부분

	    } catch (MessagingException e) {
	        throw new RuntimeException(e);
	    }

	    mailSender.send(message);
	}
	public void sendpasswordSearch(String recipientEmail, String token) {
	    MimeMessage message = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(message);

	    try {
	        helper.setTo(recipientEmail);
	        helper.setSubject("이메일 인증");

	        // 이메일 인증 링크에 email과 token 파라미터 추가
	     //   String verificationLink = "http://localhost:8155/controller/user/passwordEmail.do?email=" + recipientEmail + "&token=" + token;
	        String verificationLink = "http://jjezen.cafe24.com/gamedori/user/emailCheck.do?email=" + recipientEmail + "&token=" + token;
	        // 메일 내용 설정
	        String mailContent = "회원가입을 완료하려면 아래 링크를 클릭하세요.:\n\n" + verificationLink;
	        helper.setText(mailContent); // 수정된 부분

	    } catch (MessagingException e) {
	        throw new RuntimeException(e);
	    }

	    mailSender.send(message);
	}
	
}
