package product.command;

import command.CommandHandler;
import order.domain.ProductSangse;
import product.service.ProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ViewHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //받은 변수
        int productID = Integer.parseInt(request.getParameter("productID"));

        ProductService productService = ProductService.getInstance();
        ArrayList<ProductSangse> productSangses = productService.selectProductSangse(productID);

        request.setAttribute("productSangses", productSangses);
        return "/products/view/" + productID + ".jsp";
    }
}
