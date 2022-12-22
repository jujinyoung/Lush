package event.command;

import com.oreilly.servlet.MultipartRequest;
import command.CommandHandler;
import event.domain.EventReview;
import event.service.EventViewService;
import file.FileRequest;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class ViewHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String requestMethod = request.getMethod();
        String eventID = request.getParameter("eventID");

        if (requestMethod.equals("GET")){
            return "/event/view/"+ eventID +".jsp";
        }else if (requestMethod.equals("POST")){
//            나중에 세션처리 후 받을 값
            int memberID = 1;

            MultipartRequest mrequest = FileRequest.getFileRequest(request);
            eventID = mrequest.getParameter("eventID");
            String secret = mrequest.getParameter("secret")==null? "0" : "1";
            String content = mrequest.getParameter("cmntContent");

            EventReview eventReview = new EventReview(Integer.parseInt(eventID), memberID, secret, content);

            List<String> fileUrls = FileRequest.createFileURL(mrequest);
            EventViewService reviewService = EventViewService.getInstance();
            reviewService.insertReview(eventReview, fileUrls);


            String eventStatus = mrequest.getParameter("eventStatus");
            String currentPage = mrequest.getParameter("currentPage");
            String proceedRecords = mrequest.getParameter("proceedRecords");
            String endRecords = mrequest.getParameter("endRecords");
            response.sendRedirect("/Lush/event/view.do?eventID="+eventID+"&eventStatus="+eventStatus+"&currentPage="+currentPage+"&proceedRecords="+proceedRecords+"&endRecords="+endRecords);
        }

        return null;
    }
}
