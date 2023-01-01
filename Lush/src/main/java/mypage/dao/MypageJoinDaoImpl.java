package mypage.dao;

import com.util.JdbcUtil;

import mypage.domain.MypageJoin;
import order.domain.ProductJoin;

import java.sql.*;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;

public class MypageJoinDaoImpl implements MypageJoinDao {

	private static MypageJoinDaoImpl instance = new MypageJoinDaoImpl();

	private MypageJoinDaoImpl() {
	}

	public static MypageJoinDaoImpl getInstance() {
		return instance;
	}

	@Override
	public HashMap<Long, List<MypageJoin>> selectMypageJoin(Connection con, Long mid, List<Long> orderIdList) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT * FROM ltb_product A,ltb_ps B,ltb_mbr_prdct_ordr_details C,ltb_prdct_order D WHERE A.pd_id = B.pd_id and B.ps_id= C.ps_id and C.m_prdct_order_id = D.m_prdct_order_id and D.me_id = ? and D.m_prdct_order_id = ? and order_date > TO_DATE(?,'YY/MM/DD')";
		HashMap<Long, List<MypageJoin>> map = null;
		List<MypageJoin> list = null;
		
		try {
			map = new HashMap<>();
			
			LocalDate now = LocalDate.now().minusDays(30);
	        String nowStr = now.toString();
	        
			Iterator<Long> iterator = orderIdList.iterator();
			while (iterator.hasNext()) {
				Long oid = iterator.next();
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, mid);
				pstmt.setLong(2, oid);
				pstmt.setString(3, nowStr);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					list = new ArrayList<>();
					do {
						list.add(new MypageJoin(rs.getLong("pd_id"), rs.getLong("ps_id"), rs.getString("pd_name"),
							rs.getString("pd_cate3"), rs.getLong("ps_weight"), rs.getLong("ps_price"),
							oid, rs.getLong("m_order_details_id"),
							rs.getString("order_date"), rs.getLong("os_id"), rs.getString("os_name"),
							rs.getInt("quan")));
					} while (rs.next());
					map.put(oid, list);
				}
				
			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}

		return map;
	}
	
	@Override
	public HashMap<Long, List<MypageJoin>> searchMypageJoin2(Connection con, Long mid, List<Long> orderIdList, String sdate, String edate, int osid) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = " SELECT * FROM ltb_product A,ltb_ps B,ltb_mbr_prdct_ordr_details C,ltb_prdct_order D WHERE A.pd_id = B.pd_id and B.ps_id= C.ps_id and C.m_prdct_order_id = D.m_prdct_order_id and D.me_id = ? and D.m_prdct_order_id = ? and order_date >= TO_DATE(?,'YY/MM/DD') and order_date <= TO_DATE(?,'YY/MM/DD')+1 and os_id = ?";
		HashMap<Long, List<MypageJoin>> map = null;
		List<MypageJoin> list = null;
		
		try {
			map = new HashMap<>();

	        
			Iterator<Long> iterator = orderIdList.iterator();
			while (iterator.hasNext()) {
				Long oid = iterator.next();
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, mid);
				pstmt.setLong(2, oid);
				pstmt.setString(3, sdate);
				pstmt.setString(4, edate);
				pstmt.setLong(5, osid);

				rs = pstmt.executeQuery();

				if (rs.next()) {
					list = new ArrayList<>();
					do {
						list.add(new MypageJoin(rs.getLong("pd_id"), rs.getLong("ps_id"), rs.getString("pd_name"),
							rs.getString("pd_cate3"), rs.getLong("ps_weight"), rs.getLong("ps_price"),
							oid, rs.getLong("m_order_details_id"),
							rs.getString("order_date"), rs.getLong("os_id"), rs.getString("os_name"),
							rs.getInt("quan")));
					} while (rs.next());
					map.put(oid, list);
				}
				
			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}

		return map;
	}

}