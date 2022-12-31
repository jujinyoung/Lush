package product.dao;

import com.util.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductReviewImagesDaoImpl implements ProductReviewImagesDao{

    private static ProductReviewImagesDaoImpl instance = new ProductReviewImagesDaoImpl();
    private ProductReviewImagesDaoImpl(){}
    public static ProductReviewImagesDaoImpl getInstance(){return  instance;}

    @Override
    public ArrayList<String> selectImages(Connection conn, int productID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT pri_image FROM ltb_productReviewImages WHERE pdr_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productID);
            rs = pstmt.executeQuery();
            ArrayList<String> list = null;
            if (rs.next()){
                list = new ArrayList<>();
                do {
                    list.add(rs.getString("pri_image"));
                }while (rs.next());
            }

            return list;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public ArrayList<String> getReviewTopImages(Connection conn, ArrayList<Integer> productID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT b.* " +
                "FROM( " +
                "    SELECT ROWNUM no, pri_image " +
                "    FROM( " +
                "        SELECT * FROM ltb_productReviewImages " +
                "        WHERE pdr_id IN (? ";

        for (int i=1; i<productID.size(); i++){
            sql += ",?";
        }


        sql += " )   )t " +
        ")b " +
        "WHERE b.no BETWEEN 1 and 10 ";
        try {
            pstmt = conn.prepareStatement(sql);
            for (int i=0; i<productID.size(); i++){
                pstmt.setInt(i+1, productID.get(i));
            }

            rs = pstmt.executeQuery();
            ArrayList<String> list = null;
            if (rs.next()){
                list = new ArrayList<>();
                do {
                    list.add(rs.getString("pri_image"));
                }while (rs.next());
            }

            return list;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public int insert(Connection conn, String fileUrl, int productReviewID) throws SQLException {

        String sql = "INSERT INTO ltb_productReviewImages VALUES (ltb_productReviewImages_seq.nextval, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1, productReviewID);
            pstmt.setString(2, fileUrl);

            return pstmt.executeUpdate();
        }
    }

    @Override
    public int delete(Connection conn, int productReviewID) throws SQLException {

        PreparedStatement pstmt = null;
        String sql = "DELETE FROM ltb_productReviewImages WHERE pdr_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productReviewID);
            return pstmt.executeUpdate();
        }finally {
            JdbcUtil.close(pstmt);
        }
    }

    @Override
    public int getUserImagesCount(Connection conn, int productReviewID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM ltb_productReviewImages WHERE pdr_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productReviewID);
            rs = pstmt.executeQuery();
            int result = 0;
            if (rs.next()){
                result = rs.getInt(1);
            }

            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public ArrayList<String> getUrl(Connection conn, int productReviewID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT pri_image FROM ltb_productReviewImages WHERE pdr_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productReviewID);
            rs = pstmt.executeQuery();
            ArrayList<String> list = null;
            if (rs.next()){
                list = new ArrayList<>();
                do {
                    list.add(rs.getString(1));
                }while (rs.next());
            }
            return list;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }
}
