package managerOrder.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import managerOrder.domain.ManOrder;

public class ManOrderImpl implements ManOrderDAO{
	
	private static ManOrderImpl instance = new ManOrderImpl();
    private ManOrderImpl(){}
    public static ManOrderImpl getInstance(){
    	return  instance;
    	}

	@Override
	public List<ManOrder> selectOrderList(Connection conn, int currentPage, int numberPerPage) throws SQLException {
		int begin = (currentPage-1)*numberPerPage + 1;
        int end = begin + numberPerPage - 1;

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT a.* " +
			     " FROM( " +
			     " SELECT ROWNUM no, t.* " +
			     " FROM( " +
			     " SELECT m_order_details_id, order_person_email, order_person_addr, order_date, total_price, ps_id, os_name FROM ltb_mbr_prdct_ordr_details " +
			     " JOIN ltb_prdct_order " +
			     " ON ltb_mbr_prdct_ordr_details.m_prdct_order_id = ltb_prdct_order.m_prdct_order_id ";
          sql += " ORDER BY order_date ASC " +
        		 " )t " +
        		 " )a " +
        		 " WHERE a.no BETWEEN ? and ? ";


        List<ManOrder> list = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, begin);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()){
                list = new ArrayList<>();
                do {
                	list.add(
                			 new ManOrder(rs.getString("m_order_details_id"), 
                					 		  rs.getString("order_person_email"), 
                					          rs.getString("order_person_addr"), 
                					          rs.getDate("order_date"), 
                					          rs.getInt("total_price"),
                					          rs.getInt("ps_id"),
                					          rs.getString("os_name")));
                	
                }while (rs.next());
            }
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return list;
    }

	@Override
	public List<ManOrder> searchOrderList(Connection conn, int currentPage, int numberPerPage, int condition,
			String key) throws SQLException {
		PreparedStatement pstmt = null;
        ResultSet rs = null;

        int begin = (currentPage-1)*numberPerPage + 1;
        int end = begin + numberPerPage - 1;

        String sql = " SELECT a.* " +
			     " FROM( " +
			     " SELECT ROWNUM no, t.* " +
			     " FROM( " +
			     " SELECT m_order_details_id, order_person_email, order_person_addr, order_date, total_price, ps_id, os_name FROM ltb_mbr_prdct_ordr_details " +
			     " JOIN ltb_prdct_order " +
			     " ON ltb_mbr_prdct_ordr_details.m_prdct_order_id = ltb_prdct_order.m_prdct_order_id ";
        
        if(condition ==1) sql += " WHERE REGEXP_LIKE(m_order_details_id, ?, 'i') ";
        else sql += " WHERE REGEXP_LIKE(order_person_email, ?, 'i') ";
        sql += " ORDER BY order_date ASC)t)a WHERE a.no BETWEEN ? AND ?";

        List<ManOrder> list = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, key);
            pstmt.setInt(2, begin);
            pstmt.setInt(3, end);
            rs = pstmt.executeQuery();
            if (rs.next()){
                list = new ArrayList<>();
                do {
                	list.add(new ManOrder(rs.getString("m_order_details_id"), 
					 		  rs.getString("order_person_email"), 
					          rs.getString("order_person_addr"), 
					          rs.getDate("order_date"), 
					          rs.getInt("total_price"),
					          rs.getInt("ps_id"),
					          rs.getString("os_name")));
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
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT CEIL(COUNT(*)/?) FROM ltb_mbr_prdct_ordr_details "
        		+ "	JOIN ltb_prdct_order "
        		+ " ON ltb_mbr_prdct_ordr_details.m_prdct_order_id = ltb_prdct_order.m_prdct_order_id ";

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
