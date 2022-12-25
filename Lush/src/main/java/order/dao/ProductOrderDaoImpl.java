package order.dao;

import com.util.JdbcUtil;

import order.domain.ProductOrder;
import order.domain.ProductOrderDetails;
import order.domain.ProductPay;
import order.exception.EmptyException;

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
    public int addOrder(Connection con, ProductOrder productorder, ProductOrderDetails productorderdetails, ProductPay productpay ) throws SQLException {

        PreparedStatement pstmt = null;
        String ordersql = "INSERT INTO ltb_prdct_order VALUES (  ?,?,default,?,?,?,?,?,?,?,?,? ) ";
        String orderdetailssql = "INSERT INTO ltb_mbr_prdct_ordr_details VALUES (  seq_ltb_prdct_orderdetails.NEXTVAL,?,?,? ) ";
        String paysql = "INSERT INTO ltb_mpay VALUES (  seq_ltb_mpay.NEXTVAL,?,?,default,null,null,?,?,? ) ";
        int rowCount = 0;
        int rowCount2 = 0;
        int rowCount3 = 0;
        
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
            
            if(rowCount == 0) {
            	System.out.println("1");
            }
            
            pstmt = con.prepareStatement(orderdetailssql);
        	pstmt.setLong(1, productorderdetails.getAmount());
        	pstmt.setLong(2, productorderdetails.getPsid());
        	pstmt.setLong(3, productorderdetails.getPoid());

            rowCount2 = pstmt.executeUpdate(); 
            if(rowCount2 == 0) {
            	System.out.println("2");
            }
            
            pstmt = con.prepareStatement(paysql);
        	pstmt.setLong(1, productpay.getPoid());
        	pstmt.setLong(2, productpay.getAmount());
        	pstmt.setLong(3, productpay.getPsid());
        	pstmt.setLong(4, productpay.getMid());
        	pstmt.setLong(5, productpay.getPtid());


            rowCount3 = pstmt.executeUpdate(); 
            if(rowCount3 == 0) {
            	System.out.println("3");
            }
            System.out.println(rowCount);
            System.out.println(rowCount2);
            System.out.println(rowCount3);
            
        }finally {
            JdbcUtil.close(pstmt);
        }

        return rowCount3;
    }
    

}