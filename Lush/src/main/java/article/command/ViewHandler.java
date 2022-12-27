package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;

public class ViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
	        String requestMethod = request.getMethod();
	        String stID = request.getParameter("stID");

	        if (requestMethod.equals("GET")){
	            return "/article/view/"+ stID +".jsp";
	        }
	        return null;
	}

	
}
