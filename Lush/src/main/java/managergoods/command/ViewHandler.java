package managergoods.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import managergoods.domain.ManagerGoods;
import managergoods.service.GoodsListService;

public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		 int categoryLink = request.getParameter("categoryLink")==null ? 1 : Integer.parseInt(request.getParameter("categoryLink"));	
		 int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));
		 int numberPerPage = 1;
		
		GoodsListService listService = GoodsListService.getInstance();
		  List<ManagerGoods> goods = listService.selectGoodsList(categoryLink, currentPage, numberPerPage);
		  request.setAttribute("goods", goods);
		  
	      String requestMethod = request.getMethod();
	      String pdID = request.getParameter("pdID");

	      if (requestMethod.equals("GET")){
	            return "/managerpage/goodsview/"+ pdID +".jsp";
	        }
	        return null;
	}

	
}
