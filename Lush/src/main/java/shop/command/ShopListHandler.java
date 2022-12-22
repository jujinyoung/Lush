package shop.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import paging.PageBlock;
import paging.PageService;
import shop.domain.Shop;
import shop.service.ShopListService;

public class ShopListHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
        int searchCondition = request.getParameter("searchCondition")==null ? 1 : Integer.parseInt(request.getParameter("searchCondition"));
        String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");
        int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));

        ShopListService listService = ShopListService.getInstance();
		List<Shop> shops = null;
        PageBlock pageBlock = null;
        int numberPerPage = 10;
        int numberOfPageBlock = 10;
		
        if (searchWord.equals("")){
        	shops = listService.selectShopList(currentPage, numberPerPage);
        }else {
        	shops = listService.searchShopList(currentPage, numberPerPage, searchCondition, searchWord);
        }
        System.out.println("shop>>>" + shops);
        
        int totalPages = listService.getTotalPages(numberPerPage);
        int proceedRecords = listService.getProceedRecords();
        int endRecords = listService.getEndRecords();
        System.out.println("proceedRecords = " + proceedRecords);
        System.out.println("endRecords = " + endRecords);

        pageBlock = PageService.pagingService(currentPage, numberPerPage, numberOfPageBlock, totalPages);

        request.setAttribute("searchCondition", searchCondition);
        request.setAttribute("searchWord", searchWord);
        request.setAttribute("shops", shops);
        request.setAttribute("pageBlock", pageBlock);
        request.setAttribute("proceedRecords", proceedRecords);
        request.setAttribute("endRecords", endRecords);
        
		return "/board/shop.jsp";
	}

}
