package product.dao;

import com.util.DateFormmater;
import com.util.JdbcUtil;
import product.domian.ProductReview;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductReviewDaoImpl implements ProductReviewDao{

    private static ProductReviewDaoImpl instance = new ProductReviewDaoImpl();
    private ProductReviewDaoImpl(){}
    public static ProductReviewDaoImpl getInstance(){return  instance;}

    @Override
    public ArrayList<ProductReview> selectReviewList(Connection conn, int productID, int currentPage, int numberPerPage) throws SQLException {

        int begin = (currentPage-1)*numberPerPage + 1;
        int end = begin + numberPerPage - 1;

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT b.* " +
                "FROM( " +
                "    SELECT ROWNUM no, t.* " +
                "    FROM( " +
                "        SELECT * FROM ltb_productReview " +
                "        WHERE pd_id = ? " +
                "        ORDER BY pdr_date DESC " +
                "    )t " +
                ")b " +
                "WHERE b.no BETWEEN ? and ? ";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productID);
            pstmt.setInt(2, begin);
            pstmt.setInt(3, end);
            rs = pstmt.executeQuery();
            ArrayList<ProductReview> list = null;
            if (rs.next()){
                list = new ArrayList<>();
                do {
                    list.add(new ProductReview(rs.getInt("pdr_id"), rs.getInt("me_id"), rs.getInt("pd_id")
                    , DateFormmater.sliceDatedd(rs.getDate("pdr_date")), rs.getInt("pdr_grade"), rs.getString("pdr_content")));
                }while (rs.next());
            }

            return list;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public ArrayList<Integer> getPdr_id(Connection conn, int productID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT pdr_id FROM ltb_productReview WHERE pd_id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productID);
            rs = pstmt.executeQuery();
            ArrayList<Integer> list = null;
            if (rs.next()){
                list = new ArrayList<>();
                do {
                    list.add(rs.getInt(1));
                }while (rs.next());
            }

            return list;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public int getTotalRecords(Connection conn, int productID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM ltb_productReview WHERE pd_id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productID);
            rs = pstmt.executeQuery();
            int result = 0;
            if (rs.next()) {
                result = rs.getInt(1);
            }

            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public int insert(Connection conn, ProductReview productReview) throws SQLException {

        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;
        ResultSet rs = null;
        String sql = "INSERT INTO ltb_productReview VALUES (ltb_productReview_seq.nextval,?,?,sysdate,?,?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productReview.getMe_id());
            pstmt.setInt(2, productReview.getPd_id());
            pstmt.setInt(3, productReview.getPdr_grade());
            pstmt.setString(4, productReview.getPdr_content());
            int result = pstmt.executeUpdate();
            if (result == 1){
                sql = "SELECT MAX(pdr_id) FROM ltb_productReview";
                pstmt2 = conn.prepareStatement(sql);
                rs = pstmt2.executeQuery();
                int productReviewID = 0;
                if (rs.next()){
                    productReviewID = rs.getInt(1);
                }
                return productReviewID;
            }

            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(pstmt2);
            JdbcUtil.close(rs);
        }

    }

    @Override
    public int update(Connection conn, ProductReview productReview) throws SQLException {

        PreparedStatement pstmt = null;
        String sql = "UPDATE ltb_productReview " +
                "SET pdr_grade=?, pdr_content=? " +
                "WHERE pdr_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productReview.getPdr_grade());
            pstmt.setString(2, productReview.getPdr_content());
            pstmt.setInt(3, productReview.getPdr_id());
            return pstmt.executeUpdate();
        }finally {
            JdbcUtil.close(pstmt);
        }
    }

    @Override
    public int delete(Connection conn, int reviewID) throws SQLException {

        PreparedStatement pstmt = null;
        String sql = "DELETE FROM ltb_productReview WHERE pdr_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reviewID);
            return pstmt.executeUpdate();
        }finally {
            JdbcUtil.close(pstmt);
        }
    }

    @Override
    public ProductReview mainReview(Connection conn, int reviewID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_productReview WHERE pdr_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reviewID);
            rs = pstmt.executeQuery();
            ProductReview productReview = null;
            if (rs.next()){
                productReview = new ProductReview(rs.getInt("pdr_id"), rs.getInt("me_id"), rs.getInt("pd_id"), DateFormmater.sliceDatedd(rs.getDate("pdr_date"))
                        , rs.getInt("pdr_grade"), rs.getString("pdr_content"));
            }

            return productReview;
        }finally {
            JdbcUtil.close(pstmt);
        }
    }
}
