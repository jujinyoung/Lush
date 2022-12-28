package event.command;

import command.CommandHandler;
import event.domain.EventReviewImage;
import event.service.EventViewService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import paging.PageBlock;
import paging.PageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class ViewAjax implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //request받은 변수
        String eventID = request.getParameter("eventID");
        String currentPage = request.getParameter("currentPage");
//        System.out.println("eventID = " + eventID);
//        System.out.println("currentPage = " + currentPage);

        //검색할 개수
        int numberPerPage = 5;

        //로직처리
        EventViewService reviewService = EventViewService.getInstance();
        JSONArray jsonArray = reviewService.ajaxReviewList(Integer.parseInt(currentPage), numberPerPage);

//        System.out.println("jsonArray = " + jsonArray);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(String.valueOf(jsonArray));

        return null;
    }
}
