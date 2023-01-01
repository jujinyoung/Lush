
package member.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.CommandHandler;
import member.domain.User;
import member.exception.LoginFailException;
import member.service.LoginService;

public class LoginHandler implements CommandHandler {	
	
	private LoginService loginservice = new LoginService();
	
	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return processForm(request, response);	
		} else if( request.getMethod().equalsIgnoreCase("POST")) {
			return processSubmit(request, response); 
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
		
	}


	private String processSubmit(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		String save_id = request.getParameter("save_id");
		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);

		
		if(id == null || id.isEmpty())
			errors.put("id", Boolean.TRUE);
		if(password == null || password.isEmpty())
			errors.put("password", Boolean.TRUE);
		
		if(!errors.isEmpty()) {
			return "SignUp.jsp";
		}
		
		try {
			// loginService 를 이용해 인증을 수행 -> 로그인에 성공하면 user객체를 필터에 넘겨줌 
			User user = loginservice.login(id, password);
			if(user == null) {
				errors.put("idorpasserror", Boolean.TRUE);
				return "Login.jsp";
			}
			System.out.println( user );
			System.out.println( user.getId() ); // user 저장된 아이디 
			System.out.println( user.getName() ); // user 이름 
		
			
			// 세션 처리 
			HttpSession session = request.getSession();
			// authUser에 user(loginid, name) 저장
			session.setAttribute("authUser" , user);
			System.out.println(request.getSession() );
			 System.out.println(" 세션 추가 ");
			 
			response.sendRedirect("/Lush/index.do");
			return null;
		}catch(IOException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "SignUp.jsp";
		}
	}



	private String processForm(HttpServletRequest request, HttpServletResponse response) {
		System.out.println("GET 방식");
		return "SignUp.jsp";
	}
	
	
	
}
	
	

