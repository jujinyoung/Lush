package managergoods.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import managergoods.domain.ManagerGoods;

public class ManGoodsImpl implements ManGoodsDAO {
	
	//싱글톤
		private static ManGoodsImpl instance = new ManGoodsImpl();
	    private ManGoodsImpl(){}
	    public static ManGoodsImpl getInstance(){
	    	return  instance;
	    	}

	@Override
	public List<ManagerGoods> selectGoodsList(Connection conn, int currentPage, int numberPerPage) throws SQLException {
		// TODO Auto-generated method stub
		int begin = (currentPage-1)*numberPerPage + 1;
        int end = begin + numberPerPage - 1;

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT a.* " +
			     " FROM( " +
			     " SELECT ROWNUM no, t.* " +
			     " FROM( " +
			     " SELECT ltb_product.pd_id, pd_name, ps_weight, ps_price, ps_amount, ltb_categories.pc_id, pc_cate1, pc_cate2 FROM ltb_product " +
			     " JOIN ltb_ps " +
			     " ON ltb_product.pd_id = ltb_ps.pd_id " +
			     " JOIN ltb_categories " +
			     " ON ltb_product.pc_id = ltb_categories.pc_id";
          sql += " ORDER BY ltb_product.pd_id ASC " +
        		 " )t " +
        		 " )a " +
        		 " WHERE a.no BETWEEN ? and ? ";


        List<ManagerGoods> list = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, begin);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()){
                list = new ArrayList<>();
                do {
                	list.add(
                			 new ManagerGoods(rs.getInt("pd_id"), 
                					 		  rs.getString("pd_name"), 
                					          rs.getInt("ps_weight"), 
                					          rs.getInt("ps_price"), 
                					          rs.getInt("ps_amount"),
                					          rs.getInt("pc_id"),
                					          rs.getString("pc_cate1"),
                					          rs.getString("pc_cate2")));
                	
                }while (rs.next());
            }
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return list;
    }

	@Override
	public List<ManagerGoods> searchGoodsList(Connection conn, int currentPage, int numberPerPage, int condition, String key) throws SQLException {
		
		PreparedStatement pstmt = null;
        ResultSet rs = null;

        int begin = (currentPage-1)*numberPerPage + 1;
        int end = begin + numberPerPage - 1;

        String sql = " SELECT a.* " +
			     	 " FROM( " +
			     	 " SELECT ROWNUM no, t.* " +
			         " FROM( " +
			         " SELECT ltb_product.pd_id, pd_name, ps_weight, ps_price, ps_amount , ltb_categories.pc_id, pc_cate1, pc_cate2 FROM ltb_product " +
				     " JOIN ltb_ps " +
				     " ON ltb_product.pd_id = ltb_ps.pd_id " +
				     " JOIN ltb_categories " +
				     " ON ltb_product.pc_id = ltb_categories.pc_id";
        
        if(condition ==1) sql += " WHERE REGEXP_LIKE(pc_cate1, ?, 'i') ";
        else sql += " WHERE REGEXP_LIKE(pc_cate2, ?, 'i') ";
        sql += " ORDER BY ltb_product.pd_id ASC)t)a WHERE a.no BETWEEN ? AND ?";

        List<ManagerGoods> list = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, key);
            pstmt.setInt(2, begin);
            pstmt.setInt(3, end);
            rs = pstmt.executeQuery();
            if (rs.next()){
                list = new ArrayList<>();
                do {
                	list.add(new ManagerGoods(rs.getInt("pd_id"), 
					 		  rs.getString("pd_name"), 
					          rs.getInt("ps_weight"), 
					          rs.getInt("ps_price"), 
					          rs.getInt("ps_amount"),
					          rs.getInt("pc_id"),
					          rs.getString("pc_cate1"),
					          rs.getString("pc_cate2")));
                }while (rs.next());
            }
            return list;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

	@Override
	public int getPages(Connection conn, int numberPerPage) throws SQLException {
		PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT CEIL(COUNT(*)/?) FROM ltb_product " +
        						     " JOIN ltb_ps " +
        						     " ON ltb_product.pd_id = ltb_ps.pd_id " +
        						     " JOIN ltb_categories " +
        						     " ON ltb_product.pc_id = ltb_categories.pc_id ";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, numberPerPage);
            rs = pstmt.executeQuery();
            int result = 0;
            if (rs.next()){
                result = rs.getInt(1);
            }
            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }




}
