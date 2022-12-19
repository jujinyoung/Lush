package order.command;

import command.CommandHandler;
import event.domain.Event;
import event.service.EventListService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

public class ListHandler implements CommandHandler {

    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
//        System.out.println("ListHandler.process");
        EventListService listService = EventListService.getInstance();
        List<Event> events = listService.selectEventList();
        request.setAttribute("events", events);
        return "/event/list.jsp";
    }
}
