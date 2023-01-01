package product.command;

import command.CommandHandler;
import member.domain.User;
import net.sf.json.JSONArray;
import product.domian.Basket;
import product.service.ProductService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class CartAjax implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {


    	User user = (User) request.getSession(false).getAttribute("authUser");
    	int memberID = user.getId();

        //request받은 변수
        String[] pid = request.getParameterValues("pid[]");
        String[] psid = request.getParameterValues("psid[]");
        String[] amount = request.getParameterValues("amount[]");

        ArrayList<Basket> baskets = new ArrayList<>();
        for (int i=0; i<pid.length; i++){
            Basket basket = new Basket(memberID , Integer.parseInt(psid[i]), Integer.parseInt(amount[i]));
            baskets.add(basket);
        }


        //로직처리
        ProductService productService = ProductService.getInstance();
        int result = productService.insertCart(baskets);

        response.setCharacterEncoding("UTF-8");
        if (result == 1) {
            response.getWriter().write("성공");
        }else{
            response.getWriter().write("실패");
        }

        return null;
    }
}
