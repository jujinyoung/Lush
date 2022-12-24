package event.dao;

import com.util.DateFormmater;
import com.util.JdbcUtil;
import event.domain.EventReview;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class EventReviewDAOImpl implements EventReviewDAO{

    private static EventReviewDAOImpl instance = new EventReviewDAOImpl();
    private EventReviewDAOImpl(){}
    public static EventReviewDAOImpl getInstance(){return  instance;}
    @Override
    public int insert(Connection conn, EventReview eventReview) throws SQLException {

        PreparedStatement pstmt = null;
        PreparedStatement pstmt2 = null;
        ResultSet rs = null;
        String sql = "INSERT INTO ltb_eventReview VALUES (ltb_eventReview_seq.nextval,?,?,?,?,sysdate)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, eventReview.getEv_id());
            pstmt.setInt(2, eventReview.getMe_id());
            pstmt.setString(3, eventReview.getEr_secret());
            pstmt.setString(4, eventReview.getEr_content());
            int result = pstmt.executeUpdate();
            if (result == 1){
                sql = "SELECT MAX(er_id) FROM ltb_eventReview";
                pstmt2 = conn.prepareStatement(sql);
                rs = pstmt2.executeQuery();
                int eventReviewID = 0;
                if (rs.next()){
                    eventReviewID = rs.getInt(1);
                }
                return eventReviewID;
            }

            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(pstmt2);
            JdbcUtil.close(rs);
        }

    }

    @Override
    public List<EventReview> selectReviewList(Connection conn, int currentPage, int numberPerPage) throws SQLException {

        int begin = (currentPage-1)*numberPerPage + 1;
        int end = begin + numberPerPage - 1;

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT b.* " +
                "FROM( " +
                "    SELECT ROWNUM no, t.* " +
                "    FROM( " +
                "        SELECT * FROM ltb_eventReview " +
                "        ORDER BY er_rdate DESC " +
                "    )t " +
                ")b " +
                "WHERE b.no BETWEEN ? and ? ";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, begin);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();
            List<EventReview> list = null;
            if (rs.next()){
                list = new ArrayList<>();
                do {
                    list.add(new EventReview(rs.getInt("er_id"), rs.getInt("ev_id"), rs.getInt("me_id"), rs.getString("er_secret")
                            , rs.getString("er_content"), DateFormmater.sliceDatedd(rs.getDate("er_rdate"))));
                }while (rs.next());

                return list;
            }else {
                System.out.println("list null값뜸");
            }

            return null;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public int update(Connection conn, EventReview eventReview) throws SQLException {

        PreparedStatement pstmt = null;
        String sql = "UPDATE ltb_eventreview " +
                "SET er_secret=?, er_content=? " +
                "WHERE er_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, eventReview.getEr_secret());
            pstmt.setString(2, eventReview.getEr_content());
            pstmt.setInt(3, eventReview.getEr_id());
            return pstmt.executeUpdate();
        }finally {
            JdbcUtil.close(pstmt);
        }
    }

    @Override
    public int delete(Connection conn, int reviewID) throws SQLException {

        PreparedStatement pstmt = null;
        String sql = "DELETE FROM ltb_eventReview WHERE er_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, reviewID);
            return pstmt.executeUpdate();
        }finally {
            JdbcUtil.close(pstmt);
        }
    }

    @Override
    public int getTotalRecords(Connection conn, int eventID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM ltb_eventReview WHERE ev_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, eventID);
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
