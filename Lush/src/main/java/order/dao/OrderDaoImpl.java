package order.dao;

import com.util.JdbcUtil;
import event.domain.Event;

import java.sql.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class OrderDaoImpl implements OrderDao{

    private static OrderDaoImpl instance = new OrderDaoImpl();
    private OrderDaoImpl(){}
    public static OrderDaoImpl getInstance(){return  instance;}
    @Override
    public List<Event> selectEventList(Connection con) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM tb_event";
        List<Event> list = null;
        try {
            pstmt = con.prepareStatement(sql);
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

    private String sliceDate(Timestamp timestamp){
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm");
        return sdf.format(timestamp);
    }
}
