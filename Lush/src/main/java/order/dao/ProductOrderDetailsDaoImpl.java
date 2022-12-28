package order.dao;

import com.util.JdbcUtil;

import order.domain.ProductOrderDetails;

import java.sql.*;


public class ProductOrderDetailsDaoImpl implements ProductOrderDetailsDao{

    private static ProductOrderDetailsDaoImpl instance = new ProductOrderDetailsDaoImpl();
    private ProductOrderDetailsDaoImpl(){}
    public static ProductOrderDetailsDaoImpl getInstance(){return  instance;}
    
    @Override
    public int addOrderDetails(Connection con, ProductOrderDetails productorderdetails) throws SQLException {

        PreparedStatement pstmt = null;
        String orderdetailssql = "INSERT INTO ltb_mbr_prdct_ordr_details VALUES (  seq_ltb_prdct_orderdetails.NEXTVAL,?,?,? ) ";
        int rowCount = 0;

        try {
            pstmt = con.prepareStatement(orderdetailssql);
        	pstmt.setLong(1, productorderdetails.getAmount());
        	pstmt.setLong(2, productorderdetails.getPsid());
        	pstmt.setLong(3, productorderdetails.getPoid());

            rowCount = pstmt.executeUpdate(); 

            
        }finally {
            JdbcUtil.close(pstmt);
        }

        return rowCount;
    }
    

}