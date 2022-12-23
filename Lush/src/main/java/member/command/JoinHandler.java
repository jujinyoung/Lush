
package member.command;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import member.exception.DuplicateIdException;
import member.service.JoinRequest;
import member.service.MemberJoinService;

public class JoinHandler implements CommandHandler {
	// get -> 폼 보여주는 joinform.jsp 리턴 
	// post -> 회원가입 처리, 결과 보여주는 뷰 리턴 
	
	
	private  MemberJoinService memberJoinService = new MemberJoinService();
	
	
	
	
	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// System.out.println("JoinHandler.process");
		
		if(request.getMethod().equalsIgnoreCase("GET")) {
			
			
			return "/event/list.jsp";
			
					/*processForm(request, response);	 */// processForm() 실행 
			
		} else if( request.getMethod().equalsIgnoreCase("POST")) { 
			
			return processSubmit(request, response); 
			
			
			} else {
				
				response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
				return null;
			}
		
		}
	

	private String processSubmit(HttpServletRequest request, HttpServletResponse response){
		
		// 폼에 입력받은 데이터를 이용해 JoinRequest객체 생성 
		
		JoinRequest joinReq = new JoinRequest();
		
		joinReq.setMe_loginid(request.getParameter("me_loginid"));
		
		joinReq.setMe_name(request.getParameter("me_name"));
		
		joinReq.setMe_pass(request.getParameter("me_pass"));
		
		joinReq.setMe_add(request.getParameter("me_add"));
		
		joinReq.setMe_tel(request.getParameter("me_tel"));
		
		joinReq.setMe_nick(request.getParameter("me_nick"));
		
		joinReq.setMe_confirmpass(request.getParameter("me_confirmpass"));
		
		joinReq.setMe_email(request.getParameter("me_email"));

		
		System.out.println("joinrequest 객체 생성 완료");
		
		// 에러 담을 맵 객체 생성 -> error속성에 저장 
		
		Map<String, Boolean> errors = new HashMap<>();
		
		request.setAttribute("errors", errors);
		
		 System.out.println("error입니다.");
		 
		joinReq.validate(errors); //joinrequest 객체 값이 올바른지 검사. 값이 올바르지 않으면 error맵 객체에 키 추가
		
		
		System.out.println("erro1r입니다.");
		
		if(!errors.isEmpty()) { // error 맵 객체에 데이터가 존재하면(joinReq객체 데이터가 올바르지 않아 에러 키 추가) 
			
			System.out.println("error에 데이터가 있습니다.");
			
			return "SignUp.jsp"; // 폼 뷰로 경로를 리턴. -> 다시 폼을 보여준다.
		
		}
		
		
	
		try {
	
			memberJoinService.join(joinReq); 
	
			return "SignUpSucc.jsp"; // 가입에 성공하면 성공결과를 보여줄 경로를 리턴 
	
		}catch(DuplicateIdException e) {
	
			errors.put("duplicated", Boolean.TRUE);
	
			return "SignUp.jsp";
	
		}



		
	}
	
}
