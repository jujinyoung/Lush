package mypage.dao;

import com.util.JdbcUtil;

import mypage.domain.JinhangSum;

import java.sql.*;
import java.time.LocalDate;


public class JinhangSumDaoImpl implements JinhangSumDao{

    private static JinhangSumDaoImpl instance = new JinhangSumDaoImpl();
    private JinhangSumDaoImpl(){}
    public static JinhangSumDaoImpl getInstance(){return  instance;}
    @Override
    public JinhangSum selectJinhangSum(Connection con, long mid) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT "
        		+ " (SELECT COUNT(*) FROM ltb_prdct_order WHERE order_date > TO_DATE(?,'YY/MM/DD') and me_id = ? and os_id = 1) A, "
        		+ " (SELECT COUNT(*) FROM ltb_prdct_order WHERE order_date > TO_DATE(?,'YY/MM/DD') and me_id = ? and os_id = 2) B, "
        		+ " (SELECT COUNT(*) FROM ltb_prdct_order WHERE order_date > TO_DATE(?,'YY/MM/DD') and me_id = ? and os_id = 3) C, "
        		+ " (SELECT COUNT(*) FROM ltb_prdct_order WHERE order_date > TO_DATE(?,'YY/MM/DD') and me_id = ? and os_id = 4) D, "
        		+ " (SELECT COUNT(*) FROM ltb_prdct_order WHERE order_date > TO_DATE(?,'YY/MM/DD') and me_id = ? and os_id = 5) E, "
        		+ " (SELECT COUNT(*) FROM ltb_prdct_order WHERE order_date > TO_DATE(?,'YY/MM/DD') and me_id = ? and os_id = 6) F, "
        		+ " (SELECT COUNT(*) FROM ltb_prdct_order WHERE order_date > TO_DATE(?,'YY/MM/DD') and me_id = ? and os_id = 7) G, "
        		+ " (SELECT COUNT(*) FROM ltb_prdct_order WHERE order_date > TO_DATE(?,'YY/MM/DD') and me_id = ? and os_id = 8) H, "
        		+ " (SELECT COUNT(*) FROM ltb_prdct_order WHERE order_date > TO_DATE(?,'YY/MM/DD') and me_id = ? and os_id = 9) I "
        		+ " FROM DUAL ";
        LocalDate now = LocalDate.now().minusDays(30);
        String nowStr = now.toString();
        
        JinhangSum jinhangsum = null;
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, nowStr);
            pstmt.setLong(2, mid);
            pstmt.setString(3, nowStr);
            pstmt.setLong(4, mid);
            pstmt.setString(5, nowStr);
            pstmt.setLong(6, mid);
            pstmt.setString(7, nowStr);
            pstmt.setLong(8, mid);
            pstmt.setString(9, nowStr);
            pstmt.setLong(10, mid);
            pstmt.setString(11, nowStr);
            pstmt.setLong(12, mid);
            pstmt.setString(13, nowStr);
            pstmt.setLong(14, mid);
            pstmt.setString(15, nowStr);
            pstmt.setLong(16, mid);
            pstmt.setString(17, nowStr);
            pstmt.setLong(18, mid);

            
            rs = pstmt.executeQuery();
            
            if (rs.next()){

                do { jinhangsum = new JinhangSum(rs.getLong("A"), rs.getLong("B"), rs.getLong("C"), rs.getLong("D")
                		, rs.getLong("E"), rs.getLong("F"), rs.getLong("G"), rs.getLong("H"), rs.getLong("I"));
                }while (rs.next());
            }
            
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return jinhangsum;
    }
    

}