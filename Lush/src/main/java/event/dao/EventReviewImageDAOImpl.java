package event.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class EventReviewImageDAOImpl implements EventReviewImageDAO{

    private static EventReviewImageDAOImpl instance = new EventReviewImageDAOImpl();
    private EventReviewImageDAOImpl(){}
    public static EventReviewImageDAOImpl getInstance(){return  instance;}

    @Override
    public int insert(Connection conn, String fileUrl, int eventReviewID) throws Exception {

        String sql = "INSERT INTO ltb_evRevImg VALUES (ltb_evRevImg_seq.nextval, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1, eventReviewID);
            pstmt.setString(2, fileUrl);

            return pstmt.executeUpdate();
        }
    }
}
