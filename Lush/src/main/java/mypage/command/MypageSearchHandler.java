package mypage.command;

import command.CommandHandler;
import member.domain.User;
import mypage.service.MypageService;
import order.domain.ProductJoin;
import mypage.domain.JinhangSum;
import mypage.domain.Member;
import mypage.domain.MypageJoin;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageSearchHandler implements CommandHandler {

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


				User user = (User) session.getAttribute("authUser");
				String sid = user.getLoginid();
		    	Member member = mypageservice.selectMember(sid);
		    	long mid = member.getMid();
		    	
		    	String sdate = request.getParameter("searchStartDate");
		    	String edate = request.getParameter("searchEndDate");
		    	int osid = Integer.parseInt(request.getParameter("oss"));
		    	long oid = Long.parseLong(request.getParameter("oid"));
		    	
		    	HashMap<Long, List<MypageJoin>> map = null;
		    	
		    	if(oid == 0) {
			    	// 날짜 + 주문상태 있는 경우
			    	List<Long> orderIdList = mypageservice.getIdList(mid);
			    	map = mypageservice.searchMypageJoin2(mid, orderIdList, sdate, edate, osid);


		    	}else {
			    	// 날짜 + 주문상태 + 주문번호 있는 경우
			    	List<Long> orderIdList = new ArrayList<>();
			    	orderIdList.add(oid);
			    	map = mypageservice.searchMypageJoin2(mid, orderIdList, sdate, edate, osid);

		    	}
		    	
		        request.setAttribute("maps", map);

		        return "/mypage/mypageOrder.jsp";

    		}else if(requestMethod.equals("POST")) {
    			return null;
    		}
    	}
		return null;
    }
}
