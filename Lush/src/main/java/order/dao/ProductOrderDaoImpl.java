package order.dao;

import com.util.JdbcUtil;

import order.domain.ProductOrder;

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
    
	@Override
	public int addOrder(Connection con, ProductOrder productorder) throws SQLException {

        PreparedStatement pstmt = null;
        String ordersql = "INSERT INTO ltb_prdct_order VALUES (  ?,?,default,?,?,?,?,?,?,?,?,? ) ";
        int rowCount = 0;

        
        try {
        	pstmt = con.prepareStatement(ordersql);
        	pstmt.setLong(1, productorder.getPoid());
            pstmt.setLong(2, productorder.getMid());
            pstmt.setLong(3, productorder.getTotal());
            pstmt.setString(4, productorder.getOname());
            pstmt.setString(5, productorder.getEmail());
            pstmt.setString(6, productorder.getTel());
            pstmt.setString(7, productorder.getMsg());
            pstmt.setLong(8, productorder.getDid());
            pstmt.setString(9, productorder.getAdd());
            pstmt.setString(10, productorder.getFcheck());
            pstmt.setLong(11, productorder.getOsid());

            rowCount = pstmt.executeUpdate(); 

            
        }finally {
            JdbcUtil.close(pstmt);
        }

        return rowCount;
    }
    

}