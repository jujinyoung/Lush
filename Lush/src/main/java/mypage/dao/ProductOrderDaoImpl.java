package mypage.dao;

import com.util.JdbcUtil;

import order.domain.ProductOrder;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;


public class ProductOrderDaoImpl implements ProductOrderDao{

    private static ProductOrderDaoImpl instance = new ProductOrderDaoImpl();
    private ProductOrderDaoImpl(){}
    public static ProductOrderDaoImpl getInstance(){return  instance;}
    @Override
    public List<Long> getIdList(Connection con, long mid) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_prdct_order WHERE me_id = ? ";
        List<Long> idlist = null;
        
        try {
			
			pstmt = con.prepareStatement(sql);
            pstmt.setLong(1, mid);
            rs = pstmt.executeQuery();

			if (rs.next()) {
				idlist = new ArrayList<>();
				do {
					idlist.add(rs.getLong("m_prdct_order_id"));
					} while (rs.next());
				}
            
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return idlist;
        
    }
}