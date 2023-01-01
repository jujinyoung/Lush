package managergoods.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import command.CommandHandler;
import managergoods.domain.ManagerGoods;
import managergoods.service.GoodsListService;
import paging.PageService;

public class ListHandler implements CommandHandler {
	
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
		 int categoryLink = request.getParameter("categoryLink")==null ? 1 : Integer.parseInt(request.getParameter("categoryLink"));	
	      
	       //검색
	      int searchCondition = request.getParameter("searchCondition")==null ? 1 : Integer.parseInt(request.getParameter("searchCondition"));
	      String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");
	      int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));

	      GoodsListService listService = GoodsListService.getInstance();
	      List<ManagerGoods> goods = null;
	      paging.PageBlock pageBlock = null;
	      int numberPerPage = 10;
	      int numberOfPageBlock = 10;

	      System.out.println("searchWord = " + searchWord);
	      if (searchWord.equals("")){
	    	  goods = listService.selectGoodsList(categoryLink, currentPage, numberPerPage);
	      }else {
	    	  goods = listService.searchGoodsList(categoryLink, currentPage, numberPerPage, searchCondition, searchWord);
	      }

	      int totalPages = listService.getTotalPages(numberPerPage, categoryLink);

	      pageBlock = PageService.pagingService(currentPage, numberPerPage, numberOfPageBlock, totalPages);

	      request.setAttribute("categoryLink", categoryLink);
	      request.setAttribute("searchCondition", searchCondition);
	      request.setAttribute("searchWord", searchWord);
	      request.setAttribute("goods", goods);
	      request.setAttribute("pageBlock", pageBlock);

	      return "/managerpage/managergoods.jsp";
	  }
	}
