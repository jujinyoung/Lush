package event.dao;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import event.domain.Event;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class EventDaoImpl implements EventDao{

    private static EventDaoImpl instance = new EventDaoImpl();
    private EventDaoImpl(){}
    public static EventDaoImpl getInstance(){return  instance;}
    @Override
    public List<Event> selectEventList(Connection conn, int eventStatus, int currentPage, int numberPerPage) throws SQLException {

        int begin = (currentPage-1)*numberPerPage + 1;
        int end = begin + numberPerPage - 1;

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT b.* " +
                " FROM( " +
                "    SELECT ROWNUM no, t.* " +
                "    FROM( " +
                "        SELECT * FROM ltb_event " +
                "        WHERE ev_edate ";
        if(eventStatus == 1) sql += " > sysdate ";
        else sql += " < sysdate ";
        sql +=  "       ORDER BY ev_rdate DESC " +
                "       )t " +
                ")b " +
                "WHERE b.no BETWEEN ? and ?";


        List<Event> list = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, begin);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()){
                list = new ArrayList<>();
                do {
                    list.add(new Event(rs.getInt("ev_id"), rs.getString("ev_image"), rs.getString("ev_title"), rs.getString("ev_subtitle")
                            , rs.getString("ev_notice"), sliceDate(rs.getTimestamp("ev_rdate")), sliceDate(rs.getTimestamp("ev_edate"))));
                }while (rs.next());
            }
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return list;
    }

    @Override
    public List<Event> searchEventList(Connection conn, int eventStatus, int currentPage, int numberPerPage, int condition, String key) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int begin = (currentPage-1)*numberPerPage + 1;
        int end = begin + numberPerPage - 1;

        String sql = "SELECT b.* FROM( " +
                " SELECT ROWNUM no, t.* FROM( " +
                " SELECT * FROM ltb_event WHERE ev_edate ";

        if (eventStatus == 1) sql += "> sysdate ";
        else sql += "< sysdate";

        if (condition == 1) sql += " and REGEXP_LIKE(ev_title, ?, 'i') ";
        else sql += " and REGEXP_LIKE(ev_notice, ?, 'i') ";
        sql += " ORDER BY ev_rdate DESC)t )b WHERE b.no BETWEEN ? and ?";

        List<Event> list = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, key);
            pstmt.setInt(2, begin);
            pstmt.setInt(3, end);
            rs = pstmt.executeQuery();
            if (rs.next()){
                list = new ArrayList<>();
                do {
                    list.add(new Event(rs.getInt("ev_id"), rs.getString("ev_image"), rs.getString("ev_title"), rs.getString("ev_subtitle")
                            , rs.getString("ev_notice"), sliceDate(rs.getTimestamp("ev_rdate")), sliceDate(rs.getTimestamp("ev_edate"))));
                }while (rs.next());
            }
            return list;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public int getTotalPages(Connection conn, int numberPerPage, int eventStatus) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT CEIL(COUNT(*)/?) FROM ltb_event WHERE ev_edate";
        if (eventStatus == 1) sql += "> sysdate ";
        else sql += "< sysdate";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, numberPerPage);
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
    public int getProceedTotalRecords(Connection conn) throws Exception {

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT COUNT(*) FROM ltb_event WHERE ev_edate > sysdate";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            int result = 0;
            if (rs.next()) result = rs.getInt(1);

            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public int getEndTotalRecords(Connection conn) throws Exception {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT COUNT(*) FROM ltb_event WHERE ev_edate < sysdate";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            int result = 0;
            if (rs.next()) result = rs.getInt(1);

            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    private String sliceDate(Timestamp timestamp){
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm");
        return sdf.format(timestamp);
    }
}
