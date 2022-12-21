package order.command;

import command.CommandHandler;
import order.domain.Member;
import order.domain.ShipAdd;
import order.service.OrderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	System.out.println("OrderrHandler.process");
    	
        OrderService orderService = OrderService.getInstance();
        HttpSession session =  request.getSession(  false );
	    if( session == null) {
	    	return "/order/default.jsp";
	    }else {
	    	 String sid = (String)session.getAttribute("auth");
	    	 Member member = orderService.selectMember(sid);
	    	 ShipAdd shipadd = orderService.selectShipAdd(member);

	         request.setAttribute("member", member);
	         request.setAttribute("shipadd", shipadd);
	         return "/order/order.jsp";
	    }
       
    }
}
