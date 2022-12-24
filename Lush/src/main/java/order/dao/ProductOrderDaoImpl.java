package order.dao;

import com.util.JdbcUtil;

import order.domain.ShipAdd;

import java.sql.*;


public class ProductOrderDaoImpl implements ProductOrderDao{

    private static ProductOrderDaoImpl instance = new ProductOrderDaoImpl();
    private ProductOrderDaoImpl(){}
    public static ProductOrderDaoImpl getInstance(){return  instance;}
    @Override
    public long getOrderNum(Connection con) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT seq_ltb_prdct_order.NEXTVAL FROM dual ";
        long num = 0;
        
        try {
            pstmt = con.prepareStatement(sql);

            
            rs = pstmt.executeQuery();
            
            if (rs.next()){

                do { num = rs.getLong("NEXTVAL");
                }while (rs.next());
            }
            
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return num;
    }
    
    public int addShipAdd(Connection con, ShipAdd shipadd ) throws SQLException {

        PreparedStatement pstmt = null;
        String sql = "INSERT INTO ltb_shipAdd VALUES (  seq_ltb_shipAdd.NEXTVAL,?,?,?,?,?,?,? ) ";
        int rowCount = 0;
        
        try {
        	pstmt = con.prepareStatement(sql);
            pstmt.setString(1, shipadd.getAddress());
            pstmt.setString(2, shipadd.getSname());
            pstmt.setString(3, shipadd.getOname());
            pstmt.setString(4, shipadd.getTelnum1());
            pstmt.setString(5, shipadd.getTelnum2());
            pstmt.setString(6, shipadd.getShipdefault());
            pstmt.setLong(7, shipadd.getMid());
        		

            rowCount = pstmt.executeUpdate(); 
            
        }finally {
            JdbcUtil.close(pstmt);
        }

        return rowCount;
    }
    
    public int updateShipAdd(Connection con, ShipAdd shipadd ) throws SQLException {

        PreparedStatement pstmt = null;
        String sql = "UPDATE ltb_shipAdd SET ship_default = ? WHERE  ship_default = ? and me_id = ?";
        int rowCount = 0;
        
        try {

        	pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "0");
            pstmt.setString(2, "1");
            pstmt.setLong(3, shipadd.getMid());

        		

            rowCount = pstmt.executeUpdate(); 
            
        }finally {
            JdbcUtil.close(pstmt);
        }

        return rowCount;
    }

}