package com.cx.www.ajax;

import java.io.IOException;
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
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.cx.www.action.Action;


@WebServlet("/sendEmail")
public class SendEmailServlet extends HttpServlet{
	

	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {	
		req.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset =UTF-8");
		
		Properties p = new Properties();
		HttpSession session = req.getSession();
		String email = req.getParameter("email");
		
		p.put("mail.transport.protocol", "smtp");
		p.put("mail.smtp.host", "smtp.gmail.com");
		p.put("mail.smtp.port", "465");
		p.put("mail.smtp.auth", "true");
		
		p.put("mail.smtp.quitwait", "false");
		p.put("mail.smtp.socketFactory.port", "465");
		p.put("mail.smtp.socketFactory.class", "javax.net.ssl.SSLSocketFactory");
		p.put("mail.smtp.socketFactory.fallback", "false");
		
		
		int cnum = (int)(Math.random()*89999)+10000;
		String num = Integer.toString(cnum);
		 
		
		
		session.setAttribute("num", num);

		//보낼매세지
		StringBuffer sb = new StringBuffer();
		sb.append("<h3>안녕하세요</h3>");
		sb.append("<h3>가입테스트입니다.</h3>");
		sb.append("<h3>승인번호는" + num + " 입니다.</h3>");

		//보내는 사람 이메일
		String username = "ConvenienceX.jhta@gmail.com";
		String password = "qiduvdmlbskvajzv";

		//받는사람이메일
		String receiver = email;

		Session ss = Session.getInstance(p, new Authenticator() {
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(username, password);
			}
		});

		//메일제목
		String title = "인증 코드 : "+num;

		JSONObject jobj = new JSONObject();
		jobj.put("num", num);
		
		resp.setContentType("application/x-json; charset=utf-8");
        resp.getWriter().print(jobj);
		
		Message message = new MimeMessage(ss);
		//보내는사람
		try {
			message.setFrom(new InternetAddress(username, "ConVenienceX", "UTF-8"));
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
		
	}
	
	
}
