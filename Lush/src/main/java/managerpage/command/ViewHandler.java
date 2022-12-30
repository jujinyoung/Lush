package managerpage.command;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandHandler;
import managerpage.domain.Member;
import managerpage.service.ManagerListService;
import paging.PageService;

public class ViewHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		

		int categoryLink = request.getParameter("categoryLink")==null ? 1 : Integer.parseInt(request.getParameter("categoryLink"));	
	      //검색
	      int searchCondition = request.getParameter("searchCondition")==null ? 1 : Integer.parseInt(request.getParameter("searchCondition"));
	      String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");
	      int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));

	      ManagerListService listService = ManagerListService.getInstance();
	      List<Member> members = null;
	      paging.PageBlock pageBlock = null;
	      int numberPerPage = 6;
	      int numberOfPageBlock = 10;

	      System.out.println("searchWord = " + searchWord);
	      if (searchWord.equals("")){
	    	  members = listService.selectManagerList(categoryLink, currentPage, numberPerPage);
	      }else {
	    	  members = listService.searchManagerList(categoryLink, currentPage, numberPerPage, searchCondition, searchWord);
	      }

	      int totalPages = listService.getTotalPages(numberPerPage, categoryLink);

	      pageBlock = PageService.pagingService(currentPage, numberPerPage, numberOfPageBlock, totalPages);

	      request.setAttribute("categoryLink", categoryLink);
	      request.setAttribute("searchCondition", searchCondition);
	      request.setAttribute("searchWord", searchWord);
	      request.setAttribute("members", members);
	      request.setAttribute("pageBlock", pageBlock);

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
