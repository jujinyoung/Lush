package managerpage.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandHandler;
import managerpage.domain.Member;
import managerpage.service.ManagerListService;

public class ViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int categoryLink = request.getParameter("categoryLink")==null ? 1 : Integer.parseInt(request.getParameter("categoryLink"));	
	      
		int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));
		int numberPerPage = 1;
		
		  ManagerListService listService = ManagerListService.getInstance();
		  List<Member> managers = listService.selectManagerList(categoryLink,currentPage, numberPerPage);
		  request.setAttribute("managers", managers);
		  
	      String requestMethod = request.getMethod();
	      String meID = request.getParameter("meID");

	      if (requestMethod.equals("GET")){
	            return "/managerpage/view/"+ meID +".jsp";
	        }
	        return null;
		
		
	      /*
		// TODO Auto-generated method stub
		String requestMethod = request.getMethod();
        String meID = request.getParameter("meID");

        if (requestMethod.equals("GET")){
            return "/managerpage/view/"+ meID +".jsp";
        }
		return null;
		*/
	}

}
