package order.dao;

import com.util.JdbcUtil;

import order.domain.ProductSangse;

import java.sql.*;


public class ProductSangseDAOImpl implements ProductSangseDAO{

    private static ProductSangseDAOImpl instance = new ProductSangseDAOImpl();
    private ProductSangseDAOImpl(){}
    public static ProductSangseDAOImpl getInstance(){return  instance;}
    @Override
    public ProductSangse selectProductSangse(Connection con, Long ps_id ) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_ps WHERE ps_id = ? ";
        ProductSangse productsangse = null;
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setLong(1, ps_id);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()){

                do { 
                	productsangse= new ProductSangse(
                										rs.getLong("ps_id"), 
                										rs.getLong("ps_weight"), 
                										rs.getLong("ps_price"), 
                										rs.getLong("pd_id"), 
                										rs.getLong("pd_amount")
                									);
                }while (rs.next());
            }

            
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return productsangse;
    }

}