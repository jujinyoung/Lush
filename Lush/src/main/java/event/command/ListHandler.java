package event.command;

import command.CommandHandler;
import event.domain.Event;
import event.service.EventListService;
import paging.PageBlock;
import paging.PageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ListHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("ListHandler.process");
        //이벤트 상태 처리
        int eventStatus = 1;
        try{
            eventStatus = Integer.parseInt(request.getParameter("eventStatus"));
            request.setAttribute("eventStatus", eventStatus);
        }catch(Exception e){}

        //검색 처리
        int searchCondition = 1;
        try{
            searchCondition = Integer.parseInt(request.getParameter("searchCondition"));
            request.setAttribute("searchCondition", searchCondition);
        }catch (Exception e){}

        String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");

        int currentPage = 1;
        try {
            currentPage = Integer.parseInt(request.getParameter("currentPage"));
            request.setAttribute("currentPage", currentPage);
        }catch (Exception e){}

        //이벤트정보 조회 후 list.jsp페이지에 뿌리기
        EventListService listService = EventListService.getInstance();
        List<Event> events = null;
        PageBlock pageBlock = null;
        int numberPerPage = 12;
        int numberOfPageBlock = 10;

        if (searchWord.equals("")){
            events = listService.selectEventList(eventStatus, currentPage, numberPerPage);
        }else {
            System.out.println("searchEventList처리");
            events = listService.searchEventList(eventStatus, currentPage, numberPerPage, searchCondition, searchWord);
        }
//        System.out.println("events = " + events.size());
        int totalPages = (int) Math.ceil((events.size()/currentPage));
        System.out.println("totalPages = " + totalPages);
        pageBlock = PageService.pagingService(currentPage, numberPerPage, numberOfPageBlock, totalPages);

        request.setAttribute("events", events);
        request.setAttribute("pageBlock", pageBlock);
        return "/event/list.jsp";
    }
}
