package event.dao;


import java.sql.Connection;

public interface EventReviewImageDAO {

    public int insert(Connection conn, String fileUrl, int eventReviewID) throws Exception;
}
