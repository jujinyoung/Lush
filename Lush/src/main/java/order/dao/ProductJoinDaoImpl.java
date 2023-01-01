package order.dao;

import com.util.JdbcUtil;

import order.domain.ProductJoin;
import order.domain.ProductParameter;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class ProductJoinDaoImpl implements ProductJoinDao{

    private static ProductJoinDaoImpl instance = new ProductJoinDaoImpl();
    private ProductJoinDaoImpl(){}
    public static ProductJoinDaoImpl getInstance(){return  instance;}
    @Override
    public List<ProductJoin> selectProductJoin(Connection con, List<ProductParameter> productparameterlist) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = " SELECT * " +
        			" FROM ltb_product,ltb_ps " +
        			" WHERE ltb_product.pd_id = ltb_ps.pd_id " +
        			" AND ps_id = ?";
        List<ProductJoin> list = new ArrayList<>();
        ProductParameter pp = null;
        
        try {
			Iterator<ProductParameter> iterator = productparameterlist.iterator();
			list = new ArrayList<>();
			while (iterator.hasNext()) {
				pp = iterator.next();
				long psid = pp.getPsid();
				int amount = pp.getAmount();
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, psid);

				rs = pstmt.executeQuery();
				if (rs.next()){
	                do { list.add(new ProductJoin(rs.getLong("pd_id"), rs.getString("pd_name"), 
	                		rs.getString("pd_cate3"), rs.getLong("ps_id"), rs.getLong("ps_weight"), rs.getLong("ps_price"), amount));
	                }while (rs.next());
	            }
			}
            
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return list;
    }

}