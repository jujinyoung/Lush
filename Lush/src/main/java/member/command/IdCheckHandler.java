package member.command;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import member.dao.MemberDao;
import member.service.GoogleMail;
import member.service.IdCheckService;
import net.sf.json.JSONObject;

public class IdCheckHandler implements CommandHandler{
	
	IdCheckService idservice = new IdCheckService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		if(request.getMethod().equalsIgnoreCase("GET")) {
			return checkEmail(request, response);	
		} else if( request.getMethod().equalsIgnoreCase("POST")) {
			return checkId(request, response); 
		} else {
			response.setStatus(HttpServletResponse.SC_METHOD_NOT_ALLOWED);
			return null;
		}
}

	private String checkId(HttpServletRequest request, HttpServletResponse response) throws IOException {
	
		request.setCharacterEncoding("UTF-8");
		// ajax로 값을 받기 때문에 UTF-8로 인코딩해준다
		response.setCharacterEncoding("EUC-KR");
		
		
		System.out.println("IdCheckHandler 실행");
		String userId = request.getParameter("userId");
		System.out.println(userId);
		// join.jsp에서 받아온 key값이 userId이고
		// value값은 유저가 실제로 적은 값, String userId에는 value값이 들어간다.

		PrintWriter out = response.getWriter();
		
		int result = idservice.checkid(userId);
				
		System.out.println("idCHECK 실행");
		// 성공여부 확인 
		if (result == 0) {
			System.out.println("이미 존재하는 아이디입니다.");
		} else if (result == 1) {
			System.out.println("사용 가능한 아이디입니다.");
		}
				
		out.write(result  + ""); // --> ajax 결과값인 result가 됨
				// --> String으로 값을 내보낼 수 있도록 + "" 를 해준다		
		

		return null;
	}

	private String checkEmail(HttpServletRequest request, HttpServletResponse response) throws IOException  {
	  // request.setCharacterEncoding("UTF-8");
		// ajax로 값을 받기 때문에 UTF-8로 인코딩해준다
	//	response.setCharacterEncoding("EUC-KR");
		
		System.out.println("이메일 인증 실행");
		
		
		String userEmail = request.getParameter("userEmail");
		

		System.out.println("유저 이메일 : " + userEmail);
		
		// 이미 있는 이메일인지 확인해주는 로직 추가 
				
		
		PrintWriter out = response.getWriter();
				
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
		
		mail.sendmail(userEmail, certificationCode);
		System.out.println("인증메일 전송");
		
		// certificationCode -> 이거 view 단으로 가져 가야 됨 
		
		
		
		out.write(certificationCode  + ""); // --> ajax 결과값인 result가 됨
		// --> String으로 값을 내보낼 수 있도록 + "" 를 해준다		

		
		
		
		
		
		return null;
	}

}
