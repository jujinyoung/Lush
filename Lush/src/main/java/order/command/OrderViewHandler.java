package order.command;

import command.CommandHandler;
import order.domain.Member;
import order.domain.Product;
import order.domain.ProductSangse;
import order.domain.ShipAdd;
import order.service.OrderViewService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderViewHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	System.out.println("OrderrHandler.process");
    	HttpSession session =  request.getSession(  false );
    	
    	if( session == null) {
    		return "/order/default.jsp";
    	}else {
        	String requestMethod = request.getMethod();  
    		if(requestMethod.equals("GET")) { 
		    	OrderViewService orderViewService = OrderViewService.getInstance();
		        
		        Long pid = Long.parseLong(request.getParameter("pid"));
		        Long weight = Long.parseLong(request.getParameter("weight"));
		    	String sid = (String)session.getAttribute("auth");
		    	Member member = orderViewService.selectMember(sid);
		    	 
		    	Long mid = member.getMid();
		    	ShipAdd shipadd = orderViewService.selectShipAdd(mid);
		    	 
		    	Product product = orderViewService.selectProduct(pid);
		    	ProductSangse productsangse = orderViewService.selectProductSangse(pid, weight);
		    	 

		        request.setAttribute("member", member);
		        request.setAttribute("shipadd", shipadd);
		        request.setAttribute("productsangse", productsangse);
		        request.setAttribute("product", product);
		        return "/order/order.jsp";
		        
    		}else if(requestMethod.equals("POST")) {
    			OrderViewService orderViewService = OrderViewService.getInstance();
    	        String pid = request.getParameter("pid");
    	        String weight = request.getParameter("weight");
    	        String amount = request.getParameter("amount");
    	        
////    	        String amount = Long.parseLong(request.getParameter("amount"));
    	        String sid = (String)session.getAttribute("auth");
    		    Member member = orderViewService.selectMember(sid);
    		    Long mid = member.getMid();
    		    
    	        String default_add = request.getParameter("default-add"); //on
//    	        String default_add_n= request.getParameter("default-add-no"); //on
    	        
    		    long shid = 3;
    	        String address  = request.getParameter("address");
    	        String sname = request.getParameter("userName");
    	        String oname = request.getParameter("title");
    	        String telnum1 = request.getParameter("phone");
    	        String telnum2 = request.getParameter("mobile");
    	        String shipdefault = "";
    	            	        
    	        if(default_add.equals("yes")) {
    	        	shipdefault = "1";
    	        }else {
    	        	shipdefault = "0";
    	        }
    	        ShipAdd newship = new ShipAdd(shid, address, sname, oname, telnum1, telnum2, shipdefault, mid);
    	        
    	        int rowCount1 = 0;
    	        
    	        if(shipdefault.equals("1")) {
    	        	 rowCount1 = orderViewService.updateShipAdd(newship);
    	        }
    	        int rowCount2 = orderViewService.addShipAdd(newship);
    	        
    	        
    	        String location = "";
    	        if(rowCount2 == 0) {
    	        	location = "/Lush/order/default.jsp";
    	        }else {
    	        	location = "/Lush/order/orderview.do?pid=" + pid + "&weight=" + weight + "&amount=" +amount;
    	        }
    		    response.sendRedirect(location);
    		}
    	}
		return null;
    }
}
