package product.command;

import com.oreilly.servlet.MultipartRequest;
import command.CommandHandler;
import event.domain.EventReview;
import event.service.EventViewService;
import file.FileRequest;
import order.domain.ProductSangse;
import paging.PageBlock;
import paging.PageService;
import product.domian.Product;
import product.domian.ProductReview;
import product.domian.ProductReviewImage;
import product.service.ProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

public class ViewHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String requestMethod = request.getMethod();
        ProductService productService = ProductService.getInstance();
        if (requestMethod.equals("GET")){
            //받은 변수
            int productID = Integer.parseInt(request.getParameter("productID"));

            //로직처리
            ArrayList<ProductSangse> productSangses = productService.selectProductSangse(productID);
            ArrayList<ProductReviewImage> productReviewImages = productService.selectProductReview(productID);
            ArrayList<String> reviewTopImages = productService.selectImages(productID);

            //페이징처리
            int numberPerPage = 5;
            int numberOfPageBlock = 10;
            int totalRecords = productService.getTotalRecords(productID);
            int totalPages = (int) Math.ceil((double) totalRecords/numberPerPage);
            PageBlock pageBlock = PageService.pagingService(1, numberPerPage, numberOfPageBlock, totalPages);

            request.setAttribute("productSangses", productSangses);
            request.setAttribute("productReviewImages", productReviewImages);
            request.setAttribute("reviewTopImages", reviewTopImages);
            request.setAttribute("totalRecords", totalRecords);
            request.setAttribute("pageBlock", pageBlock);
            return "/products/view/" + productID + ".jsp";
        }else if (requestMethod.equals("POST")){

            int memberID = 1;

            //파일form처리
            String savePath = request.getServletContext().getRealPath("/upload/products");
            MultipartRequest mrequest = FileRequest.getFileRequest(request, savePath);
            String btnval = mrequest.getParameter("btnval");
            int reviewID = Integer.parseInt(mrequest.getParameter("reviewID"));
            int productID = Integer.parseInt(mrequest.getParameter("productID"));
            int score = Integer.parseInt(mrequest.getParameter("score"));
            String content = mrequest.getParameter("content");
            ProductReview productReview = new ProductReview(memberID, productID, score, content);

            //로직 실행
            if (btnval.equals("0")){
                List<String> fileUrls = FileRequest.createFileURL(mrequest);
                productService.insertReview(productReview, fileUrls);
            }else if (btnval.equals("1")){
                List<String> fileUrls = FileRequest.createFileURL(mrequest);
                productReview.setPdr_id(reviewID);
                productService.updateReview(productReview, fileUrls, savePath);
            } else if (btnval.equals("2")) {
                productService.deleteReview(reviewID, savePath, productID);
            }

            response.sendRedirect("/Lush/products/view.do?productID="+productID);
        }

        return null;
    }
}
