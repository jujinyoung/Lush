package order.command;

import command.CommandHandler;
import mypage.domain.Basket;
import mypage.service.MypageCartService;
import order.domain.Member;
import order.domain.Product;
import order.domain.ProductJoin;
import order.domain.ProductParameter;
import order.domain.ProductSangse;
import order.domain.ShipAdd;
import order.service.OrderViewService;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class OrderViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderViewHandler.process");
		HttpSession session = request.getSession(false);

		if (session == null) {
			System.out.println("세션없음");
			return "/order/default.jsp";
		} else {
			String requestMethod = request.getMethod();
			if (requestMethod.equals("GET")) {
				return null;
			} else if (requestMethod.equals("POST")) {
				int fromwhere = Integer.parseInt(request.getParameter("fromwhere"));

				if (fromwhere == 1) {
					OrderViewService orderViewService = OrderViewService.getInstance();

					String[] pids = request.getParameterValues("pid");
					String[] psids = request.getParameterValues("psid");
					String[] amounts = request.getParameterValues("amount");

					String sid = (String) session.getAttribute("auth");
//    		    	User user = session.getAttribute("authUser");
//    		    	user.getId();
					Member member = orderViewService.selectMember(sid);
					long mid = member.getMid();
					
					List<ProductParameter> productparameterlist = new ArrayList<>();
					ProductParameter productparameter = null;
					
					for(int i=0; i<psids.length; i++) {
						productparameter = new ProductParameter(Long.parseLong(psids[i]), Integer.parseInt(amounts[i]));
						productparameterlist.add(productparameter);
					}


					List<ProductJoin> list = orderViewService.selectProductJoin(productparameterlist);
					
					
					long ordernum = orderViewService.getOrderNum();
					
					ShipAdd shipadd = orderViewService.selectShipAdd(mid);

					request.setAttribute("member", member);
					request.setAttribute("shipadd", shipadd);
					request.setAttribute("productlist", list);
					request.setAttribute("ordernum", ordernum);
					request.setAttribute("fromwhere", fromwhere);

					long totalprice = 0;
					int totalamount = 0;
					Iterator<ProductJoin> iterator = list.iterator();

					while (iterator.hasNext()) {
						ProductJoin pd = iterator.next();
						totalprice += pd.getAmount() * pd.getPrice();
						totalamount += pd.getAmount();
					}

					request.setAttribute("totalprice", totalprice);
					request.setAttribute("totalamount", totalamount);

					int delprice = 0;
					if (totalprice < 15000) {
						delprice = 2500;
					}

					request.setAttribute("delprice", delprice);

					response.setHeader("Set-Cookie", "Test1=TestCookieValue1; Secure; SameSite=None");
					response.setHeader("Set-Cookie", "Test2=TestCookieValue2; Secure; SameSite=None");
					response.setHeader("Set-Cookie", "Test3=TestCookieValue3; Secure; SameSite=None");
					return "/order/order.jsp";

				} else if (fromwhere == 2) {
					MypageCartService mypagecartservice = MypageCartService.getInstance();
					OrderViewService orderViewService = OrderViewService.getInstance();
					
					String sid = (String) session.getAttribute("auth");
//			    	User user = session.getAttribute("authUser");
//			    	user.getId();
					sid = "test1";
					Member member = mypagecartservice.selectMember(sid);
					long mid = member.getMid();
					mid = 1;

					List<Basket> basketlist = mypagecartservice.selectBasket(mid);
					if(basketlist == null) {
						return "/mypage/mypageCart.jsp";
					}
					int basketsize = basketlist.size();
					Long[] psids = new Long[basketsize];
					Integer[] amounts = new Integer[basketsize];

					int i = 0;
					Iterator<Basket> iterators = basketlist.iterator();
					while (iterators.hasNext()) {
						Basket bask = iterators.next();
						psids[i] = bask.getPs_id();
						amounts[i] = bask.getBk_amount();
						i++;
					}

					long ordernum = orderViewService.getOrderNum();
					
					ShipAdd shipadd = orderViewService.selectShipAdd(mid);

					
					
					List<ProductParameter> productparameterlist = new ArrayList<>();
					ProductParameter productparameter = null;

					for (int j = 0; j < psids.length; j++) {
						productparameter = new ProductParameter(psids[j], amounts[j]);
						productparameterlist.add(productparameter);
					}

					List<ProductJoin> list = mypagecartservice.selectProductJoin(productparameterlist);

					request.setAttribute("member", member);
					request.setAttribute("shipadd", shipadd);
					request.setAttribute("productlist", list);
					request.setAttribute("ordernum", ordernum);
					request.setAttribute("fromwhere", fromwhere);

					long totalprice = 0;
					int totalamount = 0;
					Iterator<ProductJoin> iterator = list.iterator();

					while (iterator.hasNext()) {
						ProductJoin pd = iterator.next();
						totalprice += pd.getAmount() * pd.getPrice();
						totalamount += pd.getAmount();
					}

					request.setAttribute("member", member);
					request.setAttribute("shipadd", shipadd);
					request.setAttribute("productlist", list);
					request.setAttribute("ordernum", ordernum);
					request.setAttribute("fromwhere", fromwhere);
					
					request.setAttribute("totalprice", totalprice);
					request.setAttribute("totalamount", totalamount);

					int delprice = 0;
					if (totalprice < 15000) {
						delprice = 2500;
					}

					request.setAttribute("delprice", delprice);

					response.setHeader("Set-Cookie", "Test1=TestCookieValue1; Secure; SameSite=None");
					response.setHeader("Set-Cookie", "Test2=TestCookieValue2; Secure; SameSite=None");
					response.setHeader("Set-Cookie", "Test3=TestCookieValue3; Secure; SameSite=None");
					return "/order/order.jsp";
				}

			}
		}
		return null;
	}
}
