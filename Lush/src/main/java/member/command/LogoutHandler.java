
package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.CommandHandler;
import member.domain.User;

public class LogoutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("로그아웃 핸들러 실행 ");
		
		HttpSession session = request.getSession();
		
		User user = (User)session.getAttribute("authUser");
		System.out.println("세션 저장 아이디 : " + user.getId());
		
		
		if(session != null) {
			System.out.println("세션이 존재");
			session.invalidate();
			response.sendRedirect("/Lush/index.do"); // 임의 메인으로 이동
			return null;
		}
		System.out.println("세션이 없다");
		response.sendRedirect("LoginMain.jsp"); // 임의 메인으로 이동
		return null;
	}
	
	
}
