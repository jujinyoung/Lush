package order.dao;

import com.util.JdbcUtil;

import order.domain.ProductPay;
import order.exception.EmptyException;

import java.sql.*;


public class ProductPayDaoImpl implements ProductPayDao{

    private static ProductPayDaoImpl instance = new ProductPayDaoImpl();
    private ProductPayDaoImpl(){}
    public static ProductPayDaoImpl getInstance(){return  instance;}
    
    @Override
    public int addPay(Connection con, ProductPay productpay ) throws SQLException {

        PreparedStatement pstmt = null;
        String paysql = "INSERT INTO ltb_mpay VALUES (  seq_ltb_mpay.NEXTVAL,?,?,default,null,null,?,?,? ) ";
        int rowCount = 0;
        
        try {            
            pstmt = con.prepareStatement(paysql);
        	pstmt.setLong(1, productpay.getPoid());
        	pstmt.setLong(2, productpay.getAmount());
        	pstmt.setLong(3, productpay.getPsid());
        	pstmt.setLong(4, productpay.getMid());
        	pstmt.setLong(5, productpay.getPtid());


            rowCount = pstmt.executeUpdate(); 
            
        }finally {
            JdbcUtil.close(pstmt);
        }

        return rowCount;
    }
    

}