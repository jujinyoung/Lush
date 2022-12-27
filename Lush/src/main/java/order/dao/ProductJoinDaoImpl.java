package order.dao;

import com.util.JdbcUtil;

import order.domain.ProductJoin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class ProductJoinDaoImpl implements ProductJoinDao{

    private static ProductJoinDaoImpl instance = new ProductJoinDaoImpl();
    private ProductJoinDaoImpl(){}
    public static ProductJoinDaoImpl getInstance(){return  instance;}
    @Override
    public List<ProductJoin> selectProductJoin(Connection con, Long psid, int amount2 ) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = " SELECT * " +
        			" FROM ltb_product,ltb_ps " +
        			" WHERE ltb_product.pd_id = ltb_ps.pd_id " +
        			" AND ps_id = ? ";
        List<ProductJoin> list = null;
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setLong(1, psid);
            
            rs = pstmt.executeQuery();
            
            if (rs.next()){
            	list = new ArrayList<>();
                do { list.add(new ProductJoin(rs.getLong("pd_id"), rs.getString("pd_name"), 
                		rs.getString("pd_vegan"), rs.getString("pd_domestic"), rs.getString("pd_category1"), rs.getString("pd_category2"), rs.getString("pd_category3"), 
                		rs.getString("pd_image"), rs.getLong("ps_id"), rs.getLong("ps_weight"), rs.getLong("ps_price"), rs.getLong("ps_amount"), amount2));
                }while (rs.next());
            }

            
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return list;
    }

}