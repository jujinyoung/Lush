package order.command;

import command.CommandHandler;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import order.domain.ShipAdd;
import order.service.OrderViewService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class OrderShipAddAjax implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ShipAjax.process");
		OrderViewService orderViewService = OrderViewService.getInstance();

		long mid = Long.parseLong(request.getParameter("mid"));

		String default_add = request.getParameter("defaultadd");

		long shid = 0;
		String address = request.getParameter("address");
		String sname = request.getParameter("sname");
		String oname = request.getParameter("oname");
		String telnum1 = request.getParameter("telnum1");
		String telnum2 = request.getParameter("telnum2");
		String shipdefault = "";

		int rowCount1 = 0;
		int rowCount2 = 0;

		ShipAdd newship = null;

		if (default_add.equals("yes")) {
			shipdefault = "1";
			rowCount1 = orderViewService.updateShipAdd(mid);
			if (rowCount1 == 0) {
				return "/order/default.jsp";
			}
			newship = new ShipAdd(shid, address, sname, oname, telnum1, telnum2, shipdefault, mid);
			rowCount2 = orderViewService.addShipAdd(newship);
			if (rowCount2 == 0) {
				return "/order/default.jsp";
			}

			JSONObject jo = new JSONObject();
			jo.put("dellup", "yes");
			jo.put("delloname", newship.getOname());
			jo.put("dellsname", newship.getSname());
			jo.put("dellmobile", newship.getTelnum1());
			jo.put("delladd", newship.getAddress());
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(String.valueOf(jo));

		} else {
			shipdefault = "0";
			newship = new ShipAdd(shid, address, sname, oname, telnum1, telnum2, shipdefault, mid);
			rowCount2 = orderViewService.addShipAdd(newship);
			if (rowCount2 == 0) {
				return "/order/default.jsp";
			}

			JSONObject jo = new JSONObject();
			jo.put("delup", "no");
			response.setCharacterEncoding("UTF-8");
			response.getWriter().write(String.valueOf(jo));
		}
		response.setHeader("Set-Cookie", "Test1=TestCookieValue1; Secure; SameSite=None");
		response.setHeader("Set-Cookie", "Test2=TestCookieValue2; Secure; SameSite=None");
		response.setHeader("Set-Cookie", "Test3=TestCookieValue3; Secure; SameSite=None");

		return null;
	}
}
