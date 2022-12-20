package event.command;

import command.CommandHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String requestMethod = request.getMethod();
        String eventId = request.getParameter("eventID");
        if (requestMethod.equals("GET")){
            return "/event/view/"+ eventId +".jsp";
        }else if (requestMethod.equals("POST")){

        }

        return null;
    }
}
