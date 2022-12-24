package event.command;

import command.CommandHandler;
import event.domain.EventResult;
import event.domain.EventResultTitle;
import event.service.EventResultService;
import paging.PageBlock;
import paging.PageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;

public class EventResultHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        //페이징 처리
        int numberPerPage = 15;
        int numberOfPageBlock = 8;

        //request 받은 변수(나중에 시간남으면 검색처리까지 해야함)
        int searchCondition = request.getParameter("searchCondition")==null ? 1 : Integer.parseInt(request.getParameter("searchCondition"));
        int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));
        String searchWord = request.getParameter("searchWord")==null ? "" : request.getParameter("searchWord");

        //로직 실행
        EventResultService selectService = EventResultService.getInstance();
        ArrayList<EventResultTitle> eventResultTitles = selectService.selectEventList(currentPage, numberPerPage);

        int totalRecords = selectService.getTotalRecords();
        int totalPages = (int) Math.ceil((double) totalRecords/numberPerPage);
        PageBlock pageBlock = PageService.pagingService(currentPage, numberPerPage, numberOfPageBlock, totalPages);

        request.setAttribute("totalRecords", totalRecords);
        request.setAttribute("searchCondition", searchCondition);
        request.setAttribute("searchWord", searchWord);
        request.setAttribute("eventResultTitles", eventResultTitles);
        request.setAttribute("pageBlock", pageBlock);
        return "/event/eventresult.jsp";
    }
}
