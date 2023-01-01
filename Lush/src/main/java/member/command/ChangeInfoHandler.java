package member.command;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.CommandHandler;
import member.dao.FindDAO;
import member.dao.FindDAOImpl;
import member.domain.Member;
import member.domain.User;
import member.service.ChangeInfoService;

public class ChangeInfoHandler implements CommandHandler {

	private ChangeInfoService changeinfo = new ChangeInfoService();
	FindDAO findDao = FindDAOImpl.getInstance();
	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return viewinfo(request, response);	
		} else if( request.getMethod().equalsIgnoreCase("POST")) {
			return updateinfo(request, response); 
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
	}

	private String updateinfo(HttpServletRequest request, HttpServletResponse response) {
		// post 회원정보 업데이트 
		System.out.println(" changeinfoservice" );
		String nick = request.getParameter("userNickName");
		String email = request.getParameter("realemail");
		String tel  = request.getParameter("phoneNumber");
		String add = request.getParameter("sample6_address");
		System.out.println( nick );
		System.out.println( email  );
		System.out.println( tel );
		System.out.println(add  );
		
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("authUser");
		System.out.println( user.getId() ); // 세션 존재
		
		String id = user.getLoginid(); // 세션에서 아이디 읽어옴 

		 try {
				System.out.println("try 안");
				 changeinfo.upinfo(id, email, add, tel, nick);
				 return "/member/main_temp.jsp";

				
			}catch (Exception e) {
				e.printStackTrace();
				
			}
			
			return null;
		
	}

	private String viewinfo(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { // 뷰 단에 뿌리기
		// get 
		// 세션에서 아이디 값 가져옴 
		HttpSession session = request.getSession();
		System.out.println( session );
		User user = (User)session.getAttribute("authUser");
		System.out.println( user.getId() ); // 세션 존재
		
		String id = user.getLoginid(); // 아이디 읽어옴 
		
		Member member = changeinfo.isMem(id);
		
		String email = member.getMe_email();
		String tel = member.getMe_tel();
		String nick = member.getMe_nick();
		String name = member.getMe_name();
		String add = member.getMe_add();
		
		System.out.println( name ); // null 
		
		request.setAttribute("email", email);
		request.setAttribute("tel", tel);
		request.setAttribute("nick", nick );
		request.setAttribute("name", name);
		request.setAttribute("add", add);
		System.out.println( name ); // null 
		
		System.out.println("changeinfo - 이동");
		RequestDispatcher rd = request.getRequestDispatcher("/mypage/InfoChange.jsp");
		rd.forward(request, response);
		return null;
		
	
	}

}
