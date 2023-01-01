package shop.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import paging.PageBlock;
import paging.PageService;
import shop.domain.Shop;
import shop.service.ShopListService;

public class ShopViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
        int searchCondition = request.getParameter("searchCondition")==null ? 1 : Integer.parseInt(request.getParameter("searchCondition"));
        String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");
        int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));
        int spId = request.getParameter("spId") == null ? 1 : Integer.parseInt(request.getParameter("spId"));

        ShopListService listService = ShopListService.getInstance();
		List<Shop> shops = null;
        PageBlock pageBlock = null;
        int numberPerPage = 6;
        int numberOfPageBlock = 10;
		
        shops = listService.selectShopView(currentPage, numberPerPage, spId);
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
        request.setAttribute("spId", spId);
        
		return "/board/shop/view.jsp";
	}

}
