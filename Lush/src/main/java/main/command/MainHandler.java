package main.command;

import command.CommandHandler;
import main.domain.MainReview;
import main.service.MainService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class MainHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        MainService mainService = MainService.getInstance();
        ArrayList<MainReview> mainReviews = mainService.reviewList();

        request.setAttribute("mainReviews", mainReviews);
        return "/index.jsp";
    }
}
