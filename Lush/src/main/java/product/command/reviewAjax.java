package product.command;

import command.CommandHandler;
import event.service.EventViewService;
import net.sf.json.JSONArray;
import product.service.ProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class reviewAjax implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //request받은 변수
        String productID = request.getParameter("productID");
        String currentPage = request.getParameter("currentPage");

        //검색할 개수
        int numberPerPage = 5;

        //로직처리
        ProductService productService = ProductService.getInstance();
        JSONArray jsonArray = productService.ajaxReviewList(Integer.parseInt(currentPage), numberPerPage, Integer.parseInt(productID));

        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(String.valueOf(jsonArray));

        return null;
    }
}
