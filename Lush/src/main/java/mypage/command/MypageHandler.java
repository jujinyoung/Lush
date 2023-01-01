package mypage.command;

import command.CommandHandler;
import member.domain.User;
import mypage.service.MypageService;
import order.domain.ProductJoin;
import mypage.domain.JinhangSum;
import mypage.domain.Member;
import mypage.domain.MypageJoin;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

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

				User user = (User)session.getAttribute("authUser");
				String sid = user.getLoginid();
		    	Member member = mypageservice.selectMember(sid);
		    	
		    	long mid = member.getMid();

		    	JinhangSum jinhangsum = mypageservice.selectJinhangSum(mid);
		    	
		    	List<Long> orderIdList = mypageservice.getIdList(mid);
		    	
		    	HashMap<Long, List<MypageJoin>> map = mypageservice.selectMypageJoin(mid, orderIdList);

		        request.setAttribute("member", member);
		        request.setAttribute("jinhangsum", jinhangsum);  
		        request.setAttribute("maps", map);

		        return "/mypage/mypageMain.jsp";

    		}else if(requestMethod.equals("POST")) {
    			return null;
    		}
    	}
		return null;
    }
}
