package member.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import command.CommandHandler;
import member.domain.User;
import member.service.DeleteService;

public class DeleteHandler implements CommandHandler{
	DeleteService delete = new DeleteService();

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	System.out.println("delete handler");
		HttpSession session = request.getSession();
		User user = (User)session.getAttribute("authUser");
		String id = user.getLoginid();
		
		 try {
				System.out.println("try 안");
				delete.deleteinfo(id);
				session.invalidate();
				 return "/member/main_temp.jsp";

				
			}catch (Exception e) {
				e.printStackTrace();
				
			}
			
		return null;
	}
	

}
