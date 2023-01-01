package member.service;


import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;

public class MySMTPAuthenticator extends Authenticator{ // 지메일 인증번호 보내기
	
	  
	  @Override
	  protected PasswordAuthentication getPasswordAuthentication() {
//		  지메일 아이디, 비밀번호
		  return new PasswordAuthentication("lushmaster22" , "비밀번호");
	  }
	}

	 