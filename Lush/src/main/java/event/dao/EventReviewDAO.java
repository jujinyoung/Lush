package event.dao;

import event.domain.EventReview;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface EventReviewDAO {

    public int insert(Connection conn, EventReview eventReview) throws SQLException;

    public List<EventReview> selectReviewList(Connection conn, int currentPage, int numberPerPage) throws SQLException;

    public int update(Connection conn, EventReview eventReview) throws SQLException;

    public int delete(Connection conn, int reviewID) throws SQLException;

    public int getTotalRecords(Connection conn, int eventID) throws SQLException;
}
