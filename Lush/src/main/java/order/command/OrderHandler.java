package order.command;

import command.CommandHandler;
import order.domain.Member;
import order.domain.ProductOrder;
import order.domain.ProductOrderDetails;
import order.domain.ProductPay;
import order.domain.ProductSangse;
import order.service.OrderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
    	System.out.println("OrderrHandler.process");
    	HttpSession session =  request.getSession(  false );
    	
    	if( session == null) {
    		return "/order/default.jsp";
    	}else {
        	String requestMethod = request.getMethod();  
    		if(requestMethod.equals("GET")) { 
		    	return null;
    		}else if(requestMethod.equals("POST")) {
    			
    			OrderService orderService = OrderService.getInstance();
    		    
    		    long pid = Long.parseLong(request.getParameter("pid"));
    		    int weight = Integer.parseInt(request.getParameter("weight"));
    		    int amount = Integer.parseInt(request.getParameter("amount"));
    		        
    		    String sid = (String)session.getAttribute("auth");
    		    
    		    Member member = orderService.selectMember(sid);
    		    
    		    long mid = member.getMid();
    		    
    		    ProductSangse productsangse = orderService.selectProductSangse(pid, weight);
    		    
    		    long psid = productsangse.getPsid();
    		    
    		    String payType = request.getParameter("payType");
    		    long temppaypsid = 0;
    		    long temppayptid = 0;
    		    long temposid = 0;
    		    
    		    if(payType.equals("kakaopay")) {
    		    	temposid = 2;
    		    	temppaypsid = 2;
    		    	temppayptid = 1;
    		    } else if(payType.equals("send")) {
    		    	temposid = 1;
    		    	temppaypsid = 1;
    		    	temppayptid = 2;
    		    }
    		    
    		    long poid = Long.parseLong(request.getParameter("ordernum"));
    		    long pomid = mid;
    		    String odate = "0";
    		    long total = Long.parseLong(request.getParameter("totalprice1").trim());
    		    String oname = member.getName();
    		    String email = member.getEmail();
    		    String tel = member.getTelnum();
    		    String msg = request.getParameter("delmsg");
    		    long did = orderService.selectShipId(mid);
    		    String add = member.getAddress();
    		    String fcheck = request.getParameter("giftbox");
    		    long osid = temposid;
    		    
    		    ProductOrder productorder = new ProductOrder(poid, pomid, odate, total, oname, email, tel, msg, did, add, fcheck, osid);
    		    
    		    long podid = 0;
    		    long podamount = amount;
    		    long podpsid = psid;
    		    long podpoid = poid;
    		    
    		    ProductOrderDetails productorderdetails = new ProductOrderDetails(podid, podamount ,podpsid, podpoid);
    		    
    		    long payid = 0;
    		    long payoid = poid;
    		    long payamount = amount;
    		    String paydate = "0";
    		    String payname = "0";
    		    String bank = "0";
    		    long paypsid =  temppaypsid;
    		    long paymid = mid;
    		    long payptid = temppayptid;
    		    
    		    ProductPay productpay = new ProductPay(payid, payoid, payamount, paydate, payname, bank, paypsid, paymid, payptid);
    		    	 

    		    int orderCheck = 0;
    		    orderCheck = orderService.addOrder(productorder, productorderdetails, productpay);
    		    
    		    String location = "/Lush/order/ordersuccess.jsp";
    			if( orderCheck != 0) {
    				location +="?order=success";
    			}else {
    				location +="?order=fail";
    			}
    			response.sendRedirect(location); 
    		}
    	}
		return null;
    }
}
