package com.cx.www.login;

import java.io.UnsupportedEncodingException;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cxcom.cx.www.action.Action;

public class SendEmailCommand implements Action{

	@Override
	public String execute(HttpServletRequest req, HttpServletResponse resp) {
		Properties p = new Properties();
		HttpSession session = req.getSession();
		
		p.put("mail.transport.protocol", "smtp");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.auth", "true");
		
		p.put("mail.smtp.quitwait", "false");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		

		//String num = "1234"; //인증번호로 사용할예정이면 나중에는 랜덤값을 사용할예정
		String num = ""+(int)(Math.random()*100000);
		session.setAttribute("num", num);
		//out.println("<h3> 사용자에게 보낸 승인 번호 : "+num+"</h3>");

		//보낼매세지
		StringBuffer sb = new StringBuffer();
		sb.append("<h3>안녕하세요</h3>");
		sb.append("<h3>가입테스트입니다.</h3>");
		sb.append("<h3>승인번호는" + num + " 입니다.</h3>");

		//보내는 사람 이메일
		String username = "ConvenienceX.jhta@gmail.com";
		String password = "qiduvdmlbskvajzv";

		//받는사람이메일
		String receiver = "leeec1211@naver.com";

		Session ss = Session.getInstance(p, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		//메일제목
		String title = "LEC : test 인증번호입니다.";

		Message message = new MimeMessage(ss);
		//보내는사람
		try {
			message.setFrom(new InternetAddress(username, "고객지원센터", "UTF-8"));
			message.setSubject(title);
			//받는사람
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(receiver));
			//제목
			message.setContent(sb.toString(), "text/html;charset=UTF-8");
			Transport.send(message);
			//내용
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (MessagingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return num;
	}
	
	
}
