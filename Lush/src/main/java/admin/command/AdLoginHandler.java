package admin.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import admin.domain.Admin;
import admin.service.AdLoginService;
import command.CommandHandler;
import member.domain.User;

public class AdLoginHandler implements CommandHandler {

	AdLoginService adlogin = new AdLoginService();
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt( request.getParameter("adminid") );
		String pass = request.getParameter("adpassword");
		System.out.println( id );
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);

		
	/*	if(id == null || id.isEmpty())
			errors.put("id", Boolean.TRUE);*/
		if(pass == null || pass.isEmpty())
			errors.put("password", Boolean.TRUE);
		
		if(!errors.isEmpty()) {
			return "AdminLogin.jsp";
		}
		
		
		try {
			
			Admin admin = adlogin.login(id, pass);
			
			if(admin == null) {
				errors.put("idorpasserror", Boolean.TRUE);
				return "AdminLogin.jsp";
			}
		
			System.out.println( admin );
			System.out.println( admin.getAdm_id()); // user 저장된 아이디 
		// 	System.out.println( user.getName() ); // user 이름 
			HttpSession session = request.getSession();
			// authUser에 user(loginid, name) 저장
			session.setAttribute("Admin" , id );
			System.out.println(request.getSession() );
			 System.out.println(" 세션 추가 ");
			 
			response.sendRedirect("/Lush/managerpage/managerMain.jsp");
			return null;
		}catch(IOException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "SignUp.jsp";
		}
			
	
	}

	}

