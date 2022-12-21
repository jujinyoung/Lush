package member.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);

		System.out.println(" 에러 만듦 ");
		if(id == null || id.isEmpty())
			errors.put("id", Boolean.TRUE);
		if(password == null || password.isEmpty())
			errors.put("password", Boolean.TRUE);
		
		if(!errors.isEmpty()) {
			return "SignUp.jsp";
		}
		
		try {
			// loginService 를 이용해 인증을 수행 -> 로그인에 성공하면 user객체 리턴 
			User user = loginservice.login(id, password);
			// user 객체를 authuser 속성에 저장 
			request.getSession().setAttribute("authUser", user);
		//	response.sendRedirect(request.getContextPath() + "/index.jsp");
			response.sendRedirect("main_temp.jsp");
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
	
	

