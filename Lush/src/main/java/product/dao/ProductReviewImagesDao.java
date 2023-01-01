package product.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface ProductReviewImagesDao {

    public ArrayList<String> selectImages(Connection conn, int productID) throws SQLException;

    public ArrayList<String> getReviewTopImages(Connection conn, ArrayList<Integer> productID) throws SQLException;

    public int insert(Connection conn, String fileUrl, int productReviewID) throws SQLException;

    public int delete(Connection conn, int productReviewID) throws SQLException;

    public int getUserImagesCount(Connection conn, int productReviewID) throws SQLException;

    public ArrayList<String> getUrl(Connection conn, int productReviewID) throws SQLException;
}
