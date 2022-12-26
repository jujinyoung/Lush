package order.dao;

import com.util.JdbcUtil;

import order.domain.Product;

import java.sql.*;


public class ProductDaoImpl implements ProductDao{

    private static ProductDaoImpl instance = new ProductDaoImpl();
    private ProductDaoImpl(){}
    public static ProductDaoImpl getInstance(){return  instance;}
    @Override
    public Product selectProduct(Connection con, Long pid ) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_product WHERE pd_id = ? ";
        Product product = null;
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setLong(1, pid);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()){

                do { product= new Product(rs.getLong("pd_id"), rs.getString("pd_name"), 
                		rs.getString("pd_vegan"), rs.getString("pd_domestic"), rs.getString("pd_category1"), rs.getString("pd_category2"), rs.getString("pd_category3"), 
                		rs.getString("pd_image"));
                }while (rs.next());
            }

            
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return product;
    }

}