package member.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import member.domain.Member;
import member.service.ChangePassService;

public class ChangePassHandler implements CommandHandler{

	ChangePassService chpass = new ChangePassService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return changePass(request, response);	
		} else if( request.getMethod().equalsIgnoreCase("POST")) {
			return isMatch(request, response); 
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	
	private String isMatch(HttpServletRequest request, HttpServletResponse response) { // post (passemail.jsp에서)
		String authcode = (String)request.getParameter("certificationCo");
		String usercode = (String)request.getParameter("userCertifi");
		String id = (String)request.getParameter("id");
				
		
		
		System.out.println("인증번호 >" + authcode);
		System.out.println("유저번호 >" + usercode);
		System.out.println("id >" + id);
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		

		if(usercode == null || usercode.isEmpty()) {
			System.out.println("usercode = null");
			errors.put("nocode", Boolean.TRUE);
			return "PassEmail.jsp";	
		}
		
		try {
	
			Member member = chpass.isMemhere(id);
			
			System.out.println(" 비번 변경 - member객체 있음");
			
			String findid = member.getMe_loginid();
			
			System.out.println(findid);
			request.setAttribute("findid", findid);

			RequestDispatcher rd = request.getRequestDispatcher("ChangePass.jsp");
			rd.forward(request, response);
			return null;
			
			
		}catch(IOException | ServletException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "SignUp.jsp";
		}
	}



		
		
	
	

	private String changePass(HttpServletRequest request, HttpServletResponse response) {
		// changepass로부터 옴.
		// 비밀번호 = 비밀번호 확인 이면 비밀번호 수정
		String pass1 =  request.getParameter("pass1");
		String pass2 =  request.getParameter("pass2");
		String id = request.getParameter("id");
		
		System.out.println("changepass.jsp로부터 id > " + id);
		System.out.println("pass1 > " + id);
		
		System.out.println("비번 변경 핸들러");
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		
		if( pass1 != pass2) {
			errors.put("passnotmatch", Boolean.TRUE);
			return "ChangePass.jsp";	
		}
		
		if(pass1 == null || pass1.isEmpty()) {
			errors.put("pass1null", Boolean.TRUE);
			return "ChangePass.jsp";	
		}
		
		if(pass2 == null || pass2.isEmpty()) {
			errors.put("pass2null", Boolean.TRUE);
			return "ChangePass.jsp";			
		}
		
		
		try {
			System.out.println("try 안");
			 chpass.updatepass(id, pass1, pass2);
			 return "ChangePassSucc.jsp";
					 
			
			
			
		}catch (Exception e) {
			// TODO: handle exception
		}
		
		return null;
	}
}