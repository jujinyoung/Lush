package order.dao;

import com.util.JdbcUtil;

import order.domain.ShipAdd;

import java.sql.*;


public class ProductOrderDetailsDaoImpl implements ShipAddDao{

    private static ProductOrderDetailsDaoImpl instance = new ProductOrderDetailsDaoImpl();
    private ProductOrderDetailsDaoImpl(){}
    public static ProductOrderDetailsDaoImpl getInstance(){return  instance;}
    @Override
    public ShipAdd selectShipAdd(Connection con, Long mid ) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_shipAdd WHERE me_id = ? and ship_default = ? ";
        ShipAdd shipadd = null;
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setLong(1, mid);
            pstmt.setString(2, "1");
            
            rs = pstmt.executeQuery();
            
            if (rs.next()){

                do { shipadd = new ShipAdd(rs.getLong("sh_id"), rs.getString("sh_add"), rs.getString("sh_name"), 
                		rs.getString("sh_orderer"), rs.getString("sh_tel"), rs.getString("sh_phone"), 
                		rs.getString("ship_default"), rs.getLong("me_id"));
                }while (rs.next());
            }
            
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return shipadd;
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