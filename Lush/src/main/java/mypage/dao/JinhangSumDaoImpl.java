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
            pstmt.setLong(2, 1);
            pstmt.setString(3, nowStr);
            pstmt.setLong(4, 1);
            pstmt.setString(5, nowStr);
            pstmt.setLong(6, 1);
            pstmt.setString(7, nowStr);
            pstmt.setLong(8, 1);
            pstmt.setString(9, nowStr);
            pstmt.setLong(10, 1);
            pstmt.setString(11, nowStr);
            pstmt.setLong(12, 1);
            pstmt.setString(13, nowStr);
            pstmt.setLong(14, 1);
            pstmt.setString(15, nowStr);
            pstmt.setLong(16, 1);
            pstmt.setString(17, nowStr);
            pstmt.setLong(18, 1);

            
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
    
//    @Override
//    public long selectShipId(Connection con, Long mid ) throws SQLException {
//
//        PreparedStatement pstmt = null;
//        ResultSet rs = null;
//        String sql = "SELECT sh_id FROM ltb_shipAdd WHERE me_id = ? and ship_default = ? ";
//        long shid = 0;
//        
//        try {
//            pstmt = con.prepareStatement(sql);
//            pstmt.setLong(1, mid);
//            pstmt.setString(2, "1");
//            
//            rs = pstmt.executeQuery();
//            
//            if (rs.next()){
//
//                do { shid = rs.getLong("sh_id");
//                }while (rs.next());
//            }
//            
//        }finally {
//            JdbcUtil.close(pstmt);
//            JdbcUtil.close(rs);
//        }
//
//        return shid;
//    }
//    
//    @Override
//    public int addShipAdd(Connection con, ShipAdd shipadd ) throws SQLException {
//
//        PreparedStatement pstmt = null;
//        String sql = "INSERT INTO ltb_shipAdd VALUES (  seq_ltb_shipAdd.NEXTVAL,?,?,?,?,?,?,? ) ";
//        int rowCount = 0;
//        
//        try {
//        	pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, shipadd.getAddress());
//            pstmt.setString(2, shipadd.getSname());
//            pstmt.setString(3, shipadd.getOname());
//            pstmt.setString(4, shipadd.getTelnum1());
//            pstmt.setString(5, shipadd.getTelnum2());
//            pstmt.setString(6, shipadd.getShipdefault());
//            pstmt.setLong(7, shipadd.getMid());
//
//            rowCount = pstmt.executeUpdate(); 
//            
//        }finally {
//            JdbcUtil.close(pstmt);
//        }
//
//        return rowCount;
//    }
//    
//    @Override
//    public int updateShipAdd(Connection con, long mid ) throws SQLException {
//
//        PreparedStatement pstmt = null;
//        String sql = "UPDATE ltb_shipAdd SET ship_default = ? WHERE  ship_default = ? and me_id = ?";
//        int rowCount = 0;
//        
//        try {
//
//        	pstmt = con.prepareStatement(sql);
//            pstmt.setString(1, "0");
//            pstmt.setString(2, "1");
//            pstmt.setLong(3, mid);
//
//            rowCount = pstmt.executeUpdate(); 
//            
//        }finally {
//            JdbcUtil.close(pstmt);
//        }
//
//        return rowCount;
//    }

}