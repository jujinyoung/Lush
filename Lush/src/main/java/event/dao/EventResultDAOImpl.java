package event.dao;

import com.util.DateFormmater;
import com.util.JdbcUtil;
import event.domain.EventResult;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class EventResultDAOImpl implements EventResultDAO {

    private static EventResultDAOImpl instance = new EventResultDAOImpl();
    private EventResultDAOImpl(){}
    public static EventResultDAOImpl getInstance(){return  instance;}

    @Override
    public ArrayList<EventResult> selectList(Connection conn, int currentPage, int numberPerPage) throws SQLException {

        int begin = (currentPage-1)*numberPerPage + 1;
        int end = begin + numberPerPage - 1;

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT b.* " +
                "FROM( " +
                "    SELECT ROWNUM no, t.* " +
                "    FROM( " +
                "        SELECT * FROM ltb_eventResult " +
                "        ORDER BY es_rdate DESC " +
                "        )t " +
                "    )b " +
                "WHERE b.no BETWEEN ? and ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, begin);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();
            ArrayList<EventResult> list = null;
            if (rs.next()){
                list = new ArrayList<>();
                do {
                    list.add(new EventResult(rs.getInt("ev_id"), rs.getString("es_content"), DateFormmater.sliceDatedd(rs.getDate("es_rdate")), rs.getInt("es_readed")));
                }while (rs.next());
            }
            return list;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public int getTotalRecords(Connection conn) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM ltb_eventResult";
        try {
            pstmt = conn.prepareStatement(sql);
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
