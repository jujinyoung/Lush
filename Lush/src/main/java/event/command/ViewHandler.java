package event.command;

import command.CommandHandler;
import file.FileRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ViewHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String requestMethod = request.getMethod();
        String eventID = request.getParameter("eventID");

        if (requestMethod.equals("GET")){
            return "/event/view/"+ eventID +".jsp";
        }else if (requestMethod.equals("POST")){
            String[] fileURL = FileRequest.createFileURL(request);


            request.setAttribute("eventID",eventID);
            response.sendRedirect("/Lush/event/view.do?eventID="+eventID);
        }

        return null;
    }
}
