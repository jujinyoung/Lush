package event.dao;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface EventReviewImageDAO {

    public int insert(Connection conn, String fileUrl, int eventReviewID) throws SQLException;

    public ArrayList<String> selectImages(Connection conn, int eventID) throws SQLException;

    public int delete(Connection conn, int eventReviewID) throws SQLException;

    public ArrayList<String> getUrl(Connection conn, int eventReviewID) throws SQLException;

    public int getUserImagesCount(Connection conn, int eventReviewID) throws SQLException;
}
