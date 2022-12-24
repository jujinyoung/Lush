
package member.command;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import member.domain.Member;
import member.domain.User;
import member.service.FindIdService;

public class FindIdHandler implements CommandHandler {

	FindIdService findservice = new FindIdService();
	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String name = request.getParameter("name");
		String email = request.getParameter("email");
		
		
		System.out.println( request.getParameter("email") );
		// 서비스에서 name email -> member 객체? 
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);

		if(name == null || name.isEmpty()) {
			System.out.println("name = null");
			errors.put("namenull", Boolean.TRUE);
			return "FindId.jsp";	
		}
			if(email == null || email.isEmpty()) {
			errors.put("emailnull", Boolean.TRUE);
			System.out.println("email = null");
	
			return "FindId.jsp";	
			// email만 null 로 뜸

			}	
		if(!errors.isEmpty()) {
			return "FindIdError.jsp";
		}
	
		try {
			// loginService 를 이용해 인증을 수행 -> 로그인에 성공하면 member객체 리턴 
			Member member = findservice.findid(name, email);
			if(member == null) {
				System.out.println("member = null");
				errors.put("nomember", Boolean.TRUE);
				return "FindId.jsp";
			}
			
			//memeber 객체 있음 -> me_loginid 리턴 
			System.out.println("핸들러 - member객체 있음");
			
			String findid = member.getMe_loginid();
			String findname = member.getMe_name();
			
			System.out.println(findid);
		//	response.sendRedirect("FindIdSucc.jsp");
			
			//RequestDispatcher 객체가 전달될 경로 지정
			request.setAttribute("findid", findid);
			request.setAttribute("findname", findname);
			
			RequestDispatcher rd = request.getRequestDispatcher("FindIdSucc.jsp");
			
			//forward를 통해 지정된 경로로 request, reponse 객체 전달
			rd.forward(request, response);
			return null;
			
	
		}catch(IOException e) {
			errors.put("idOrPwNotMatch", Boolean.TRUE);
			return "SignUp.jsp";
		}
	}

	
}
