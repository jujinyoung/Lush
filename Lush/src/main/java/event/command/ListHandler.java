package event.command;

import command.CommandHandler;
import event.domain.Event;
import event.domain.Eventlist;
import event.service.EventListService;
import event.service.EventViewService;
import paging.PageBlock;
import paging.PageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
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
        EventViewService viewService = EventViewService.getInstance();
        EventListService listService = EventListService.getInstance();
        List<Event> events = null;
        int numberPerPage = 12;
        int numberOfPageBlock = 10;

        if (searchWord.equals("")){
            events = listService.selectEventList(eventStatus, currentPage, numberPerPage);
        }else {
            events = listService.searchEventList(eventStatus, currentPage, numberPerPage, searchCondition, searchWord);
        }
        ArrayList<Eventlist> eventList = new ArrayList<>();
        for (Event event: events) {
            int totalReview = viewService.getTotalReview((int) event.getId());
            eventList.add(new Eventlist(event, totalReview));
        }

        int totalPages = listService.getTotalPages(numberPerPage, eventStatus);
        int proceedRecords = listService.getProceedRecords();
        int endRecords = listService.getEndRecords();

        PageBlock pageBlock = PageService.pagingService(currentPage, numberPerPage, numberOfPageBlock, totalPages);

        request.setAttribute("eventStatus", eventStatus);
        request.setAttribute("searchCondition", searchCondition);
        request.setAttribute("searchWord", searchWord);
        request.setAttribute("events", eventList);
        request.setAttribute("pageBlock", pageBlock);
        request.setAttribute("proceedRecords", proceedRecords);
        request.setAttribute("endRecords", endRecords);

        return "/event/list.jsp";
    }
}
