package order.dao;

import com.util.JdbcUtil;

import order.domain.ProductSangse;

import java.sql.*;


public class ProductSangseDaoImpl implements ProductSangseDao{

    private static ProductSangseDaoImpl instance = new ProductSangseDaoImpl();
    private ProductSangseDaoImpl(){}
    public static ProductSangseDaoImpl getInstance(){return  instance;}
    @Override
    public ProductSangse selectProductSangse(Connection con, Long pid, int weight ) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_ps WHERE pd_id = ? and ps_weight = ?";
        ProductSangse productsangse = null;
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setLong(1, pid);
            pstmt.setLong(2, weight);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()){

                do { productsangse= new ProductSangse(rs.getLong("ps_id"), rs.getLong("ps_weight"), 
                		rs.getLong("ps_price"), rs.getLong("pd_id"), rs.getLong("ps_amount"));
                }while (rs.next());
            }

            
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return productsangse;
    }

}