package mypage.command;

import command.CommandHandler;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageOrderHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	System.out.println("MypageOrderHandler.process");
    	HttpSession session =  request.getSession(  false );
    	
    	if( session == null) {
    		System.out.println("세션없음");
    		return "/order/default.jsp";
    	}else {
        	String requestMethod = request.getMethod();  
    		if(requestMethod.equals("GET")) { 


		        return "/mypage/mypageOrder.jsp";

    		}else if(requestMethod.equals("POST")) {
    			return null;
    		}
    	}
		return null;
    }
}
