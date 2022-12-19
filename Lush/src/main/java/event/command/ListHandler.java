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
        int eventStatus = request.getParameter("eventStatus")==null ? 1 : Integer.parseInt(request.getParameter("eventStatus"));

        //검색 처리
        int searchCondition = request.getParameter("searchCondition")==null ? 1 : Integer.parseInt(request.getParameter("searchCondition"));
        String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");
        int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));

        //이벤트정보 조회 후 list.jsp페이지에 뿌리기
        EventListService listService = EventListService.getInstance();
        List<Event> events = null;
        PageBlock pageBlock = null;
        int numberPerPage = 12;
        int numberOfPageBlock = 10;

        System.out.println("searchWord = " + searchWord);
        if (searchWord.equals("")){
            events = listService.selectEventList(eventStatus, currentPage, numberPerPage);
        }else {
            events = listService.searchEventList(eventStatus, currentPage, numberPerPage, searchCondition, searchWord);
        }

        int totalPages = listService.getTotalPages(numberPerPage, eventStatus);

        pageBlock = PageService.pagingService(currentPage, numberPerPage, numberOfPageBlock, totalPages);

        request.setAttribute("eventStatus", eventStatus);
        request.setAttribute("searchCondition", searchCondition);
        request.setAttribute("searchWord", searchWord);
        request.setAttribute("events", events);
        request.setAttribute("pageBlock", pageBlock);

        return "/event/list.jsp";
    }
}
