package mypage.command;

import command.CommandHandler;
import member.domain.User;
import order.domain.Member;
import order.domain.Product;
import order.domain.ProductJoin;
import order.domain.ProductParameter;
import order.domain.ProductSangse;
import order.domain.ShipAdd;
import mypage.domain.Basket;
import mypage.service.MypageCartService;

import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MypageCartHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MypageCartHandler.process");
		HttpSession session = request.getSession(false);

		if (session == null) {
			System.out.println("세션없음");
			return "/order/default.jsp";
		} else {
			String requestMethod = request.getMethod();
			if (requestMethod.equals("GET")) {
				MypageCartService mypagecartservice = MypageCartService.getInstance();

//				String sid = (String) session.getAttribute("auth");
//		    	User user = rgetAttribute("authUser");
				User user = (User) request.getSession(false).getAttribute("authUser");
				String sid = user.getLoginid();
				Member member = mypagecartservice.selectMember(sid);
				long mid = member.getMid();

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

				List<ProductParameter> productparameterlist = new ArrayList<>();
				ProductParameter productparameter = null;

				for (int j = 0; j < psids.length; j++) {
					productparameter = new ProductParameter(psids[j], amounts[j]);
					productparameterlist.add(productparameter);
				}

				List<ProductJoin> list = mypagecartservice.selectProductJoin(productparameterlist);

				request.setAttribute("member", member);
				request.setAttribute("productlist", list);

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
				return "/mypage/mypageCart.jsp";
				
			} else if (requestMethod.equals("POST")) {
				MypageCartService mypagecartservice = MypageCartService.getInstance();

//		    	User user = session.getAttribute("authUser");
//		    	user.getId();
				User user = (User) request.getSession(false).getAttribute("authUser");
				String sid = user.getLoginid();
				Member member = mypagecartservice.selectMember(sid);
				long mid = member.getMid();

				String[] lists = request.getParameterValues("psid");
				List<Long> psidlist = new ArrayList<>();

				for (int i = 0; i < lists.length; i++) {
					psidlist.add(Long.parseLong(lists[i]));
				}
				mypagecartservice.deleteBasket(mid, psidlist);

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
				
				List<ProductParameter> productparameterlist = new ArrayList<>();
				ProductParameter productparameter = null;

				for (int j = 0; j < psids.length; j++) {
					productparameter = new ProductParameter(psids[j], amounts[j]);
					productparameterlist.add(productparameter);
				}

				List<ProductJoin> list = mypagecartservice.selectProductJoin(productparameterlist);
				
				request.setAttribute("member", member);
				request.setAttribute("productlist", list);

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
				return "/mypage/mypageCart.jsp";
			}
		}
		return null;
	}
}
