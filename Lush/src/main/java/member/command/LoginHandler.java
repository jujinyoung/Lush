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
			// loginService 를 이용해 인증을 수행 -> 로그인에 성공하면 user객체 리턴 
			User user = loginservice.login(id, password);
			if(user == null) {
				errors.put("idorpasserror", Boolean.TRUE);
				return "Login.jsp";
			}
			// user 객체를 authuser 속성에 저장 아이디 / 이름 
			if(save_id!=null) {
				System.out.println(" 체크박스 표시 함 ");
			       Cookie c = new Cookie("save_id",id);
	                //쿠키값 저장 시간을 지정함, 숫자당 1초로 계산
	                c.setMaxAge(60*60*24*7); //7일간 저장
	                response.addCookie(c);
			} else {
                Cookie c = new Cookie("save_id",id);
                System.out.println(" 새쿠키 만듦 ");
                c.setMaxAge(0);
                response.addCookie(c);
            }
			HttpSession session = request.getSession();
			 request.getSession().setAttribute("authUser", user);
			 System.out.println(" 세션 추가 ");
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
	
	

