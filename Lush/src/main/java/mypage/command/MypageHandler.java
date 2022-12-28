package mypage.command;

import command.CommandHandler;
import mypage.service.MypageService;
import mypage.domain.Member;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	System.out.println("MypageHandler.process");
    	HttpSession session =  request.getSession(  false );
    	
    	if( session == null) {
    		System.out.println("세션없음");
    		return "/order/default.jsp";
    	}else {
        	String requestMethod = request.getMethod();  
    		if(requestMethod.equals("GET")) { 
				MypageService mypageservice = MypageService.getInstance();
		        
		        
		    	String sid = (String)session.getAttribute("auth");
		    	Member member = mypageservice.selectMember(sid);

		        request.setAttribute("member", member);

		        

		        return "/mypage/mypageMain.jsp";

    		}else if(requestMethod.equals("POST")) {
    			return null;
    		}
    	}
		return null;
    }
}
