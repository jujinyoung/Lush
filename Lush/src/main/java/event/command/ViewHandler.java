package event.command;

import com.oreilly.servlet.MultipartRequest;
import command.CommandHandler;
import event.domain.EventReview;
import event.domain.EventReviewImage;
import event.service.EventViewService;
import file.FileRequest;
import paging.PageBlock;
import paging.PageService;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class ViewHandler implements CommandHandler {
    @Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

        String requestMethod = request.getMethod();

        if (requestMethod.equals("GET")){
            //request받은 변수
            String eventID = request.getParameter("eventID");
            String currentPage = request.getParameter("currentPage");
            int proceedRecords = request.getParameter("proceedRecords")==null ? 0 : Integer.parseInt(request.getParameter("proceedRecords"));
            int endRecords = request.getParameter("endRecords")==null ? 0 : Integer.parseInt(request.getParameter("endRecords"));

            //페이징 처리
            int numberPerPage = 5;
            int numberOfPageBlock = 10;


            //로직처리
            EventViewService reviewService = EventViewService.getInstance();
            ArrayList<EventReviewImage> reviews = reviewService.selectReview(Integer.parseInt(currentPage), numberPerPage);

            int totalRecords = reviewService.getTotalReview(Integer.parseInt(eventID));
            int totalPages = (int) Math.ceil((double) totalRecords/numberPerPage);
            PageBlock pageBlock = PageService.pagingService(Integer.parseInt(currentPage), numberPerPage, numberOfPageBlock, totalPages);

            request.setAttribute("proceedRecords", proceedRecords);
            request.setAttribute("endRecords", endRecords);
            request.setAttribute("totalRecords", totalRecords);
            request.setAttribute("pageBlock", pageBlock);
            request.setAttribute("reviews", reviews);
            request.setAttribute("eventID", eventID);
            return "/event/view/"+ eventID +".jsp";
        }else if (requestMethod.equals("POST")){
//            나중에 세션처리 후 받을 값
            int memberID = 1;


            //파일form처리
            String savePath = request.getServletContext().getRealPath("/upload/event");
            MultipartRequest mrequest = FileRequest.getFileRequest(request, savePath);
            String btnval = mrequest.getParameter("btnval");
            int reviewID = Integer.parseInt(mrequest.getParameter("reviewID"));
            String eventID = mrequest.getParameter("eventID");
            String secret = mrequest.getParameter("secret")==null? "0" : "1";
            String content = mrequest.getParameter("cmntContent");
            EventReview eventReview = new EventReview(Integer.parseInt(eventID), memberID, secret, content);

            //request 받은 변수
            String eventStatus = mrequest.getParameter("eventStatus");
            String currentPage = mrequest.getParameter("currentPage");
            String proceedRecords = mrequest.getParameter("proceedRecords");
            String endRecords = mrequest.getParameter("endRecords");
            String searchWord = mrequest.getParameter("searchWord");

            //로직 실행
            EventViewService reviewService = EventViewService.getInstance();
            if (btnval.equals("0")){
                List<String> fileUrls = FileRequest.createFileURL(mrequest);
                reviewService.insertReview(eventReview, fileUrls);
            }else if (btnval.equals("1")){
                List<String> fileUrls = FileRequest.createFileURL(mrequest);
                eventReview.setEr_id(reviewID);
                reviewService.updateReview(eventReview, fileUrls, savePath);
            } else if (btnval.equals("2")) {
                reviewService.deleteReview(reviewID, savePath);
            }

            response.sendRedirect("/Lush/event/view.do?eventID="+eventID+"&eventStatus="+eventStatus+"&currentPage="+currentPage+"&proceedRecords="+proceedRecords+"&endRecords="+endRecords+"&searchWord="+searchWord);
        }

        return null;
    }
}
