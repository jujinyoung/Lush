package member.command;

import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.CommandHandler;
import member.domain.Member;
import member.service.ChangePassService;
import member.service.GoogleMail;

public class MailHandler implements CommandHandler {
	
	ChangePassService chpass = new ChangePassService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return changepass(request, response);	
		} else if( request.getMethod().equalsIgnoreCase("POST")) {
			return ismember(request, response); 
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
		
	}

	private String ismember(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String email = request.getParameter("email");
		System.out.println("post 방식으로 받음");
		
		Map<String, Boolean> errors = new HashMap<>();
		request.setAttribute("errors", errors);
		
		if(id == null || id.isEmpty())
		System.out.println("id 입력안함");
		errors.put("id", Boolean.TRUE);
		
		if(email == null || email.isEmpty())
			System.out.println("email 입력안함");
			errors.put("email", Boolean.TRUE);
	
		try {
			// 아이디 + 이메일 에 해당하는 멤버 객체가 있는지 확인
			Member member = chpass.isMemhere(id, email);
			if(member == null) { // 멤버 x 
				System.out.println("member = null");
				errors.put("nomember", Boolean.TRUE);
				return "FindPassPre.jsp"; // 비밀번호 찾기 화면으로 돌아가 팝업 띄우기 
			}
			// 멤버 객체가 있음 -> 이메일 인증번호 전송하기 
			
			GoogleMail mail = new GoogleMail();
			
			// 인증키 랜덤 생성
			Random rnd = new Random();
			String certificationCode = "";
	
			
			int randum = 0;
			for(int i = 0; i < 7; i++) {
				randum = rnd.nextInt(9 - 0 + 1);
				certificationCode += randum;
			}
			
			System.out.println(" 확인용 코드 ->  "+ certificationCode);
			// 랜덤 생성 코드-> 사용자 email 전송 
			HttpSession session = request.getSession();
			
			try {
				// 보낸 메일과 비교해서 맞으면 사용하겠다
			mail.sendmail(email, certificationCode);
			System.out.println("인증메일 전송");
			
			session.setAttribute("certificationCode", certificationCode); // 
			// 자바에서 보낸 코드를 세션에 저장
			System.out.println(certificationCode);
			request.setAttribute("email", email);
			// 적은 이메일 주소를 담음 -> { email} 로 발송되었습니다 
			request.setAttribute("id", id);
			
			
			request.setAttribute("certificationCodel",certificationCode);
			System.out.println(certificationCode);
			} catch(Exception e) {
				e.printStackTrace();
			}
			
			RequestDispatcher rd = request.getRequestDispatcher("PassEmail.jsp");
			
			//forward를 통해 지정된 경로로 request, reponse 객체 전달
			rd.forward(request, response);
			return null;
			
			
			
			
			
		} catch (Exception e) {
			// TODO: handle exception
		}
		
		
		return null;
	}

	private String changepass(HttpServletRequest request, HttpServletResponse response) {
		
		// 회원가입 이메일 인증 처리 
		// 이메일 인증 코드 보내기 
		// 파라미터로 보냄 (포워드)
		//회원가입창에서 저장하고, js로 인증 확인 클릭하면 
		return null;
	
	}

	
	
}
