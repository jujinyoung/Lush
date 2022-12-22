package shop.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ShopDaoImpl implements ShopDao {
	
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;
	
	public ShopDaoImpl() {}
	
	public ShopDaoImpl(Connection conn) {
		this.conn = conn;
	}
	
	public void setConn(Connection conn) {
		this.conn = conn;
	}
	
	@Override
	public ArrayList<ShopDto> select(int currentPage, int numberPerPage) throws SQLException {
		ArrayList<ShopDto> list = null;
		ShopDto dto = null; 

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
			list = new ArrayList<ShopDto>();

			do {
				dto = new ShopDto();
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
	
	
}
