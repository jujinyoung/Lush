package categories.command;

import categories.domain.CategoriesTop;
import categories.service.CategoriesService;
import command.CommandHandler;
import paging.PageBlock;
import paging.PageService;
import product.domian.ProductDetails;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class CategoriesHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //request받은 변수
        int categoriesID = Integer.parseInt(request.getParameter("categoriesID"));
        int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));
        int selectStatus = request.getParameter("selectStatus")==null ? 2 : Integer.parseInt(request.getParameter("selectStatus"));

        //페이징 처리
        int numberPerPage = 16;
        int numberOfPageBlock = 10;

        //로직 실행
        CategoriesService categoriesService = CategoriesService.getInstance();
        //상단카테고리 작업
        ArrayList<CategoriesTop> categoriesTops = categoriesService.selectCategoriesTop(categoriesID);
        //상품정보 불러오는 작업
        ArrayList<ProductDetails> productDetails = categoriesService.selectProductDetailsList(categoriesID, selectStatus, currentPage, numberPerPage);

        try {
            int totalRecords = productDetails.size();
            int totalPages = (int) Math.ceil((double) totalRecords/numberPerPage);
            PageBlock pageBlock = PageService.pagingService(currentPage, numberPerPage, numberOfPageBlock, totalPages);
            request.setAttribute("pageBlock", pageBlock);
        }catch (Exception e){
            System.out.println("상품 없음");
        }

        request.setAttribute("categoriesTops", categoriesTops);
        request.setAttribute("productDetails", productDetails);
        request.setAttribute("selectStatus", selectStatus);
        return "/categories/index.jsp";
    }
}
