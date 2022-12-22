package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import com.util.JdbcUtil;

import shop.domain.Shop;

public class ShopDaoImpl implements ShopDao {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	private static ShopDaoImpl instance = new ShopDaoImpl();
	public ShopDaoImpl() {}
	public static ShopDaoImpl getInstance(){return  instance;}
	
	
	public ShopDaoImpl(Connection conn) {
		this.conn = conn;
	}
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	@Override
	public ArrayList<Shop> selectShopList(Connection conn, int currentPage, int numberPerPage) throws SQLException {
		ArrayList<Shop> list = null;
		Shop dto = null; 

		int begin = ( currentPage-1)*numberPerPage + 1;
		int end = begin + numberPerPage -1;

		String sql = 
				" SELECT b.* "
						+ " FROM (  "
						+ "        SELECT ROWNUM no, t.* "
						+ "        FROM (  "
						+ "                SELECT sp_id, sp_rdate, sp_edate, sp_image, sp_name, sp_adr_k, sp_adr_e, sp_bhour1, sp_bhour2, sp_tel, sp_sns, sp_info, adm_id "
						+ "                FROM ltb_shop "
						+ "                ORDER BY seq DESC "
						+ "              ) t "
						+ "     ) b "
						+ " WHERE b.no BETWEEN ? AND ?";

		this.pstmt = this.conn.prepareStatement(sql);

		// BETWEEN ? AND ?"
		this.pstmt.setInt(1, begin);
		this.pstmt.setInt(2, end);

		this.rs =  this.pstmt.executeQuery();

		if ( this.rs.next()) {
			list = new ArrayList<Shop>();

			do {
				dto = new Shop();
				dto.setSp_id(this.rs.getInt("sp_id"));
				dto.setSp_rdate(this.rs.getDate("sp_rdate"));
				dto.setSp_edate(this.rs.getDate("sp_edate"));
				dto.setSp_image(this.rs.getString("sp_image"));
				dto.setSp_name(this.rs.getString("sp_name"));
				dto.setSp_adr_k(this.rs.getString("sp_adr_k"));
				dto.setSp_adr_e(this.rs.getString("sp_adr_e"));
				dto.setSp_bhour1(this.rs.getString("sp_bhour1"));
				dto.setSp_bhour2(this.rs.getString("sp_bhour2"));
				dto.setSp_tel(this.rs.getString("sp_tel"));
				dto.setSp_sns(this.rs.getString("sp_sns"));
				dto.setSp_info(this.rs.getString("sp_info"));
				dto.setAdm_id(this.rs.getInt("adm_id"));

				list.add(dto);
			} while ( this.rs.next() );

		} // if

		this.rs.close(); // 
		this.pstmt.close();

		return  list;  // 게시글이 존재하지 않으면  list = null ..
	}
	
	@Override
	public ArrayList<Shop> searchShopList(Connection conn, int currentPage, int numberPerPage, int searchCondition, String searchWord) throws SQLException {
		ArrayList<Shop> list = null;
		Shop dto = null; 
		
		int begin = ( currentPage-1)*numberPerPage + 1;
		int end = begin + numberPerPage -1;
		
		String sql = 
				" SELECT b.* "
						+ " FROM (  "
						+ "        SELECT ROWNUM no, t.* "
						+ "        FROM (  "
						+ "                SELECT sp_id, sp_rdate, sp_edate, sp_image, sp_name, sp_adr_k, sp_adr_e, sp_bhour1, sp_bhour2, sp_tel, sp_sns, sp_info, adm_id "
						+ "                FROM ltb_shop "
						+ "                ORDER BY seq DESC "
						+ "              ) t "
						+ "     ) b "
						+ " WHERE b.no BETWEEN ? AND ?";
		
		this.pstmt = this.conn.prepareStatement(sql);
		
		// BETWEEN ? AND ?"
		this.pstmt.setInt(1, begin);
		this.pstmt.setInt(2, end);
		
		this.rs =  this.pstmt.executeQuery();
		
		if ( this.rs.next()) {
			list = new ArrayList<Shop>();
			
			do {
				dto = new Shop();
				dto.setSp_id(this.rs.getInt("sp_id"));
				dto.setSp_rdate(this.rs.getDate("sp_rdate"));
				dto.setSp_edate(this.rs.getDate("sp_edate"));
				dto.setSp_image(this.rs.getString("sp_image"));
				dto.setSp_name(this.rs.getString("sp_name"));
				dto.setSp_adr_k(this.rs.getString("sp_adr_k"));
				dto.setSp_adr_e(this.rs.getString("sp_adr_e"));
				dto.setSp_bhour1(this.rs.getString("sp_bhour1"));
				dto.setSp_bhour2(this.rs.getString("sp_bhour2"));
				dto.setSp_tel(this.rs.getString("sp_tel"));
				dto.setSp_sns(this.rs.getString("sp_sns"));
				dto.setSp_info(this.rs.getString("sp_info"));
				dto.setAdm_id(this.rs.getInt("adm_id"));
				
				list.add(dto);
			} while ( this.rs.next() );
			
		} // if
		
		this.rs.close(); // 
		this.pstmt.close();
		
		return  list;  // 게시글이 존재하지 않으면  list = null ..
	}
	
	@Override
    public int getTotalPages(Connection conn, int numberPerPage) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT CEIL(COUNT(*)/?) FROM ltb_shop WHERE sp_rdate > sysdate";
        
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

    @Override
    public int getProceedTotalRecords(Connection conn) throws Exception {

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT COUNT(*) FROM ltb_shop WHERE sp_rdate > sysdate";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            int result = 0;
            if (rs.next()) result = rs.getInt(1);

            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public int getEndTotalRecords(Connection conn) throws Exception {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT COUNT(*) FROM ltb_shop WHERE sp_rdate < sysdate";
        try {
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            int result = 0;
            if (rs.next()) result = rs.getInt(1);

            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    private String sliceDate(Timestamp timestamp){
        SimpleDateFormat sdf = new SimpleDateFormat("YYYY-MM-dd HH:mm");
        return sdf.format(timestamp);
    }
}
