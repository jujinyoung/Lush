package admin.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.CommandHandler;

public class AdLogoutHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("로그아웃 핸들러 실행 ");
		
		HttpSession session = request.getSession();
		
	//	String ad = (String)session.getAttribute("Admin");
	//	System.out.println(" 관리자 세션 저장 아이디 : " + ad );
		
		
		if(session != null) {
			System.out.println("세션이 존재");
			session.invalidate();
			response.sendRedirect("AdminLogin.jsp"); // 임의 메인으로 이동
			return null;
		}
		System.out.println("세션이 없다");
		response.sendRedirect("LoginMain.jsp"); // 임의 메인으로 이동
		return null;
	}
}
