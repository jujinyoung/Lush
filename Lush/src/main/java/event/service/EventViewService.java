package event.service;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import event.dao.EventReviewDAO;
import event.dao.EventReviewDAOImpl;
import event.dao.EventReviewImageDAO;
import event.dao.EventReviewImageDAOImpl;
import event.domain.EventReview;
import event.exception.EventImageInsertException;
import event.exception.EventReviewException;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class EventViewService {

    private static EventViewService instance = new EventViewService();
    private EventViewService(){}
    public static EventViewService getInstance(){return instance;}

    EventReviewDAO reviewDAO = EventReviewDAOImpl.getInstance();
    EventReviewImageDAO imageDAO = EventReviewImageDAOImpl.getInstance();

    public void insertReview(EventReview eventReview, List<String> fileUrl){
        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            conn.setAutoCommit(false);

            int eventReviewID = reviewDAO.insert(conn, eventReview);
            if (eventReviewID==0){
                throw new EventReviewException("이벤트리뷰 데이터 입력 에러");
            }

            if (!fileUrl.isEmpty()){
                int result = 0;
                for (String url: fileUrl) {
                    result = imageDAO.insert(conn, url, eventReviewID);
                    if (result == 0) throw new EventImageInsertException("이벤트 이미지 입력 에러");
                }
            }

            conn.commit();
        }catch (EventReviewException | EventImageInsertException e){
            JdbcUtil.rollback(conn);
        } catch (Exception e){
            JdbcUtil.rollback(conn);
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
    }
}
