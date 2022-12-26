package order.dao;

import com.util.JdbcUtil;

import order.domain.Product;

import java.sql.*;
import java.util.List;


public class ProductDAOImpl implements ProductDAO{

    private static ProductDAOImpl instance = new ProductDAOImpl();
    private ProductDAOImpl(){}
    public static ProductDAOImpl getInstance(){return  instance;}
    
    public Product selectProduct(Connection con, Long pd_id ) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_product";
        Product product = null;
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setLong(1, pd_id);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()){

            	do { 
            		product= new Product(
            				rs.getLong("pd_id"), 
            				rs.getString("pd_name"), 
            				rs.getString("pd_vegan"), 
            				rs.getString("pd_domestic"), 
            				rs.getString("pd_category1"), 
            				rs.getString("pd_category2"), 
            				rs.getString("pd_category3"), 
            				rs.getString("pd_image"),
            				rs.getInt("pd_price")
            				);
            	}while (rs.next());
            }

            
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return product;
    }

}