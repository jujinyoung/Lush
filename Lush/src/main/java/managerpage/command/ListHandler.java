package managerpage.command;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandHandler;
import managerpage.domain.Member;
import managerpage.service.ManagerListService;
import paging.PageService;

public class ListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		  
		  //검색
	      int searchCondition = request.getParameter("searchCondition")==null ? 1 : Integer.parseInt(request.getParameter("searchCondition"));
	      String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");
	      int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));

	      ManagerListService listService = ManagerListService.getInstance();
	      List<Member> managers = null;
	      paging.PageBlock pageBlock = null;
	      int numberPerPage = 10;
	      int numberOfPageBlock = 10;

	      System.out.println("searchWord = " + searchWord);
	      if (searchWord.equals("")){
	    	  managers = listService.selectManagerList(currentPage, numberPerPage); 
	      }else {
	    	  managers = listService.searchManagerList(currentPage, numberPerPage, searchCondition, searchWord);
	      }

	      int totalPages = listService.getTotalPages(numberPerPage);

	      pageBlock = PageService.pagingService(currentPage, numberPerPage, numberOfPageBlock, totalPages);

	      request.setAttribute("searchCondition", searchCondition);
	      request.setAttribute("searchWord", searchWord);
	      request.setAttribute("managers", managers);
	      request.setAttribute("pageBlock", pageBlock);

		return "/managerpage/memberman.jsp";
	}

	
}
