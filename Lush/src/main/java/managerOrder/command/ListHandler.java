package managerOrder.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import managerOrder.domain.ManOrder;
import managerOrder.service.OrderListService;
import paging.PageService;

public class ListHandler implements CommandHandler{

	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
	    
	       //검색
	      int searchCondition = request.getParameter("searchCondition")==null ? 1 : Integer.parseInt(request.getParameter("searchCondition"));
	      String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");
	      int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));

	      OrderListService listService = OrderListService.getInstance();
	      List<ManOrder> orders = null;
	      paging.PageBlock pageBlock = null;
	      int numberPerPage = 10;
	      int numberOfPageBlock = 10;

	      System.out.println("searchWord = " + searchWord);
	      if (searchWord.equals("")){
	    	  orders = listService.selectOrderList(currentPage, numberPerPage);
	      }else {
	    	  orders = listService.searchOrderList(currentPage, numberPerPage, searchCondition, searchWord);
	      }

	      int totalPages = listService.getTotalPages(numberPerPage);

	      pageBlock = PageService.pagingService(currentPage, numberPerPage, numberOfPageBlock, totalPages);

	      request.setAttribute("searchCondition", searchCondition);
	      request.setAttribute("searchWord", searchWord);
	      request.setAttribute("orders", orders);
	      request.setAttribute("pageBlock", pageBlock);

	      return "/managerpage/managerOrder.jsp";
	  }
	}

