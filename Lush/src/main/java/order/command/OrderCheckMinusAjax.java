package order.command;

import command.CommandHandler;
import net.sf.json.JSONObject;
import order.service.OrderService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class OrderCheckMinusAjax implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("OrderCheckMinusAjax.process");
		OrderService orderService = OrderService.getInstance();

		List<Long> psidlist = new ArrayList<>();
		List<Long> amountlist = new ArrayList<>();
		List<Long> customerAmountList = new ArrayList<>();

		String[] arrayParam = request.getParameterValues("psidamountlist[]");
		
		for (int i = 0; i < arrayParam.length; i++) {
			if (i % 2 == 0) { // psid
				psidlist.add(Long.parseLong(arrayParam[i]));
			} else { // customer amount
				customerAmountList.add(Long.parseLong(arrayParam[i]));
			}
		}
		amountlist = orderService.getAmountList(psidlist);
		
		String isAmountZero = "0"; // 0이면 재고 있고 1이면 재고 없음
		for (int i = 0; i < psidlist.size(); i++) {
			if (amountlist.get(i) < customerAmountList.get(i)) {
				System.out.println("호");
				System.out.println(i);
				isAmountZero = "1";
				break;
			}
		}
		
		if (isAmountZero == "0") { // 재고 있으면 재고 미리 감소
			orderService.minusAmount(psidlist, customerAmountList);
		}

		JSONObject jo = new JSONObject();
		jo.put("isAmountZero", isAmountZero);
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(String.valueOf(jo));

		response.setHeader("Set-Cookie", "Test1=TestCookieValue1; Secure; SameSite=None");
		response.setHeader("Set-Cookie", "Test2=TestCookieValue2; Secure; SameSite=None");
		response.setHeader("Set-Cookie", "Test3=TestCookieValue3; Secure; SameSite=None");

		return null;
	}
}
