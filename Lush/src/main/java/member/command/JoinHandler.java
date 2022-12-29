
package member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import member.domain.Member;
import member.exception.DuplicateIdException;
import member.service.JoinRequest;
import member.service.JoinService;

public class JoinHandler implements CommandHandler {

	private  JoinService joinService = new JoinService();
		
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return null;
		} else if( request.getMethod().equalsIgnoreCase("POST")) { 
			return processSubmit(request, response); 	
			} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
			}
		
		}
	

	private String processSubmit(HttpServletRequest request, HttpServletResponse response){
		// 폼에 입력받은 데이터를 이용해 JoinRequest객체 생성 
		
		String id = request.getParameter("loginId");
		String name = request.getParameter("name");
		String tel = request.getParameter("tel");
		String add = request.getParameter("sample6_address");
		String nick = request.getParameter("nick");
		String email = request.getParameter("fakeEmail");
		String password = request.getParameter("password");
		String passcon = request.getParameter("passwordconfirm");
		
		
		System.out.println(id);
		System.out.println(name);
		System.out.println(tel );
		
		JoinRequest joinReq = new JoinRequest();
		joinReq.setMe_loginid(id);
		joinReq.setMe_pass(password);
		joinReq.setMe_confirmpass(passcon);
		joinReq.setMe_name(name);
		joinReq.setMe_add(add );
		joinReq.setMe_tel(tel );
		joinReq.setMe_nick(nick );
		joinReq.setMe_email(email);

		
		System.out.println("joinrequest 객체 생성 완료");

		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors); 
		joinReq.validate(errors); 
		//joinrequest 객체 값이 올바른지 검사. 값이 올바르지 않으면 error맵 객체에 키 추가

		
		if(!errors.isEmpty()) {  
			System.out.println("error에 데이터가 있습니다.");
			return "SignUpMain.jsp"; // 폼 뷰로 경로를 리턴. -> 다시 폼을 보여준다.
	//	
		}
		
		
	
		try {
			joinService.join(joinReq); 
			return "SignUpSucc.jsp"; // 가입에 성공하면 성공결과를 보여줄 경로를 리턴 
		}catch(DuplicateIdException e) {
	//		errors.put("duplicated", Boolean.TRUE);
			return "SignUp.jsp";
		}



		
	}
	
}
	

