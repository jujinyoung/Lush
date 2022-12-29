package order.command;

import command.CommandHandler;
import net.sf.json.JSONObject;
import order.service.OrderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class OrderPlusAjax implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderPlusAjax.process");
		OrderService orderService = OrderService.getInstance();

		List<Long> psidlist = new ArrayList<>();
		List<Long> customerAmountList = new ArrayList<>();

		String[] arrayParam = request.getParameterValues("psidamountlist[]");
		for (int i = 0; i < arrayParam.length; i++) {
			if (i % 2 == 0) { // psid
				psidlist.add(Long.parseLong(arrayParam[i]));
			} else { // customer amount
				customerAmountList.add(Long.parseLong(arrayParam[i]));
			}
		}

		orderService.plusAmount(psidlist, customerAmountList);


		response.setCharacterEncoding("UTF-8");
		JSONObject jo = new JSONObject();
		jo.put("suc", "0");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(String.valueOf(jo));
		response.setHeader("Set-Cookie", "Test1=TestCookieValue1; Secure; SameSite=None");
		response.setHeader("Set-Cookie", "Test2=TestCookieValue2; Secure; SameSite=None");
		response.setHeader("Set-Cookie", "Test3=TestCookieValue3; Secure; SameSite=None");

		return null;
	}
}
