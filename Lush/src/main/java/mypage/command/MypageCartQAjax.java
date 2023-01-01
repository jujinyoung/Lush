package mypage.command;

import command.CommandHandler;
import mypage.service.MypageCartService;
import net.sf.json.JSONObject;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class MypageCartQAjax implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MypageCartQAjax.process");
		MypageCartService mypagecartservice = MypageCartService.getInstance();

		
		long mid = Long.parseLong(request.getParameter("mid"));
		long psid = Long.parseLong(request.getParameter("psid"));
		String plusminus = request.getParameter("plusminus");
		
		if(plusminus.equals("m")) {
			mypagecartservice.minusAmount(mid, psid);
		}
		else {
			mypagecartservice.plusAmount(mid, psid);
		}
		
		JSONObject jo = new JSONObject();
		jo.put("pm", "pm");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(String.valueOf(jo));

		return null;
	}
}
