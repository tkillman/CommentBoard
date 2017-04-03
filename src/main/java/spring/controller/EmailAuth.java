package spring.controller;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeUtility;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class EmailAuth {

	
	@RequestMapping("emailAuth.do")
	public ModelAndView emailAuth(String email){
		
		String authNum=RandomNum();
		
		sendEmail(email,authNum);
		
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("emailcheck");
		mav.addObject("email",email);
		mav.addObject("authNum",authNum);
		return mav;
		
	}
	
	public String RandomNum(){
		StringBuffer buffer = new StringBuffer();
		
		for(int i=0;i<=6;i++){
			
			int n = (int)(Math.random() *10);
			buffer.append(n);
			
		}
		return buffer.toString();
	}
	
	
	public void sendEmail(String email, String authNum){
		String host = "smtp.naver.com";
		final String user = "timekillman"; //이메일 아이디
		final String password= "bstar28700!"; //이메일 비밀번호
		String to = email;
				
				
		String content="인증번호["+authNum+"]";
		
		try{
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.auth", "true");
			
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator(){
				protected PasswordAuthentication getPasswordAuthentication(){
					return new PasswordAuthentication(user,password);
				}
				
			} );
			
			MimeMessage message = new MimeMessage(session);
			message.setFrom(new InternetAddress(user));
			message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
			
			//subject
			message.setSubject("[subject] java Mail Teset");
			
			//Text
			message.setText("[인증번호 : " + authNum +"]");
			
			//send
			
			Transport.send(message);
			System.out.println("메세지 전송 완료");
						
		} catch(Exception e){
			e.printStackTrace();
		}//try
		
		
	}//sendEmail
	
	
	
} // class
