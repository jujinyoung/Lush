package product.dao;

import event.domain.EventReview;
import product.domian.ProductReview;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface ProductReviewDao {

    public ArrayList<ProductReview> selectReviewList(Connection conn, int productID, int currentPage, int numberPerPage) throws SQLException;

    public ArrayList<Integer> getPdr_id(Connection conn, int productID) throws SQLException;

    public int getTotalRecords(Connection conn, int productID) throws SQLException;

    public int insert(Connection conn, ProductReview productReview) throws SQLException;

    public int update(Connection conn, ProductReview productReview) throws SQLException;

    public int delete(Connection conn, int reviewID) throws SQLException;
}
