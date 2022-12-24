package order.command;

import command.CommandHandler;
import order.domain.Member;
import order.domain.Product;
import order.domain.ProductJoin;
import order.domain.ProductSangse;
import order.domain.ShipAdd;
import order.service.OrderViewService;

import java.util.Iterator;
import java.util.List;

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
		    	return null;
    		}else if(requestMethod.equals("POST")) {
    			int fromwhere = Integer.parseInt(request.getParameter("fromwhere"));
    			
    			if(fromwhere == 1 || fromwhere == 3) {
    				OrderViewService orderViewService = OrderViewService.getInstance();
    		        
    		        Long pid = Long.parseLong(request.getParameter("pid"));
    		        int weight = Integer.parseInt(request.getParameter("weight"));
    		        int amount = Integer.parseInt(request.getParameter("amount"));
    		        
    		    	String sid = (String)session.getAttribute("auth");
    		    	Member member = orderViewService.selectMember(sid);
    		    	 
    		    	Long mid = member.getMid();
    		    	
//    		    	Product product = orderViewService.selectProduct(pid);
    		    	ProductSangse productsangse = orderViewService.selectProductSangse(pid, weight);
    		    	
    		    	Long psid = productsangse.getPsid();
    		    	
    		    	List<ProductJoin> list = orderViewService.selectProductJoin(pid, amount);
    		    	
    		    	Long ordernum = orderViewService.getOrderNum();
    		    	
    		        if(fromwhere == 3) {
            		    
            	        String default_add = request.getParameter("default-add"); //on
//            	        String default_add_n= request.getParameter("default-add-no"); //on
            	        
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
            	        	return "/order/default.jsp";
            	        }
    		        }

    		    	ShipAdd shipadd = orderViewService.selectShipAdd(mid);
    		    	 

    		    	
    		    	request.setAttribute("pid", pid);
    		    	request.setAttribute("weight", weight);
    		    	request.setAttribute("amount", amount);
    		    	request.setAttribute("psid", psid);
    		    	
    		        request.setAttribute("member", member);
    		        request.setAttribute("shipadd", shipadd);
//    		        request.setAttribute("productsangse", productsangse);
//    		        request.setAttribute("product", product);
    		        request.setAttribute("productlist", list);
    		        request.setAttribute("ordernum", ordernum);
    		        
    		        long totalprice = 0;
    		        int totalamount = 0;
    		        Iterator<ProductJoin> iterator = list.iterator();
    		        
    		        while (iterator.hasNext()) {
    		            ProductJoin pd = iterator.next();
    		            totalprice += pd.getAmount2() * pd.getPrice();
    		            totalamount += pd.getAmount2();
    		        } 
    		        
    		        request.setAttribute("totalprice", totalprice);
    		        request.setAttribute("totalamount", totalamount);
    		        
    		        int delprice = 0;
    		        if(totalprice < 15000) {
    		        	delprice = 2500;
    		        }
    		        
    		        request.setAttribute("delprice", delprice);
    		        
    		        
    		        return "/order/order.jsp";
    		        
    			}else if(fromwhere == 2) {
    				return null;
    			}

    		}
    	}
		return null;
    }
}
