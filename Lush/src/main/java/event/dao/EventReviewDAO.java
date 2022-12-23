package event.dao;

import event.domain.EventReview;

import java.sql.Connection;

public interface EventReviewDAO {

    public int insert(Connection conn, EventReview eventReview) throws Exception;
}
