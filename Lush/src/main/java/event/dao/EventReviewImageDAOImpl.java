package event.dao;

import com.util.JdbcUtil;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EventReviewImageDAOImpl implements EventReviewImageDAO{

    private static EventReviewImageDAOImpl instance = new EventReviewImageDAOImpl();
    private EventReviewImageDAOImpl(){}
    public static EventReviewImageDAOImpl getInstance(){return  instance;}

    @Override
    public int insert(Connection conn, String fileUrl, int eventReviewID) throws SQLException {

        String sql = "INSERT INTO ltb_evRevImg VALUES (ltb_evRevImg_seq.nextval, ?, ?)";
        try (PreparedStatement pstmt = conn.prepareStatement(sql)){
            pstmt.setInt(1, eventReviewID);
            pstmt.setString(2, fileUrl);

            return pstmt.executeUpdate();
        }
    }

    @Override
    public ArrayList<String> selectImages(Connection conn, int eventID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_evRevImg WHERE er_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, eventID);
            rs = pstmt.executeQuery();
            ArrayList<String> list = null;
            if (rs.next()){
                list = new ArrayList<>();
                do {
                    list.add(rs.getString("eri_image"));
                }while (rs.next());
            }

            return list;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public int delete(Connection conn, int eventReviewID) throws SQLException {

        PreparedStatement pstmt = null;
        String sql = "DELETE FROM ltb_evRevImg WHERE er_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, eventReviewID);
            return pstmt.executeUpdate();
        }finally {
            JdbcUtil.close(pstmt);
        }
    }

    @Override
    public ArrayList<String> getUrl(Connection conn, int eventReviewID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT eri_image FROM ltb_evRevImg WHERE er_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, eventReviewID);
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

    @Override
    public int getUserImagesCount(Connection conn, int eventReviewID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM ltb_evRevImg WHERE er_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, eventReviewID);
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
}
