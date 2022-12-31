package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.CommandHandler;
import member.domain.Member;
import member.domain.User;
import member.service.SmsService;
import member.service.SmsSignature;

public class SmsHandler implements CommandHandler {

	SmsService smsservice = new SmsService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return numcheck(request, response);	
		} else if( request.getMethod().equalsIgnoreCase("POST")) {
			return smscheck(request, response); 
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String smscheck(HttpServletRequest request, HttpServletResponse response) throws IOException { // post 
		
		SmsSignature sms = new SmsSignature();
		System.out.println("sms 문자 보냄");
		sms.sendSMS();
		
		// 보낸 난수를 받음 
		String smsnum = "1234";
		
		 PrintWriter out = response.getWriter();
		System.out.println( smsnum ); 
		out.write(smsnum   + ""); 
		
		
		return null;
	}

	private String numcheck(HttpServletRequest request, HttpServletResponse response) throws IOException { //GET
		// 세션 USER
		//request.getSession().invalidate();
		HttpSession session  = request.getSession();
		
		 System.out.println( session ); 
		 User user =  (User)session.getAttribute("authUser");
		 System.out.println(user.getLoginid()); 	
		 String userid = user.getLoginid();
		 
		 PrintWriter out = response.getWriter();
		 
		String phonenum = request.getParameter("phonenum");
		System.out.println( "유저 입력 번호 > " + phonenum  ); 
		
		Member member = smsservice.memeixst(userid);
		String usertel = member.getMe_tel();
		System.out.println( "회원 정보 번호 > " + usertel  ); 
		
		int result = 0;
		
		// num 
		if( !phonenum.equals(usertel)  ) {
			result = 0;
			System.out.println( result); 
			out.write(result  + ""); 
		}else { // 같으면 
			result = 1;
			System.out.println( result); 
			out.write(result  + "");
			
			// sms보내는 
			
			
			
			
		}
		
		
		
	//	System.out.println(user.getTel() );
		return null;
	}

}
