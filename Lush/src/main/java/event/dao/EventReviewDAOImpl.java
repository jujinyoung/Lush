package event.dao;

import com.util.DateFormmater;
import com.util.JdbcUtil;
import event.domain.EventReview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

public class EventReviewDAOImpl implements EventReviewDAO{

    private static EventReviewDAOImpl instance = new EventReviewDAOImpl();
    private EventReviewDAOImpl(){}
    public static EventReviewDAOImpl getInstance(){return  instance;}
    @Override
    public int insert(Connection conn, EventReview eventReview) throws Exception {

        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;
        ResultSet rs = null;
        String sql = "INSERT INTO ltb_eventReview VALUES (ltb_eventReview_seq.nextval,?,?,?,?,sysdate)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, eventReview.getEv_id());
            pstmt.setInt(2, eventReview.getMe_id());
            pstmt.setString(3, eventReview.getEr_secret());
            pstmt.setString(4, eventReview.getEr_content());
            int result = pstmt.executeUpdate();
            if (result == 1){
                sql = "SELECT MAX(er_id) FROM ltb_eventReview";
                pstmt2 = conn.prepareStatement(sql);
                rs = pstmt2.executeQuery();
                int eventReviewID = 0;
                if (rs.next()){
                    eventReviewID = rs.getInt(1);
                }
                return eventReviewID;
            }

            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(pstmt2);
            JdbcUtil.close(rs);
        }

    }
}
