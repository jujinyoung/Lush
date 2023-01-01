package mypage.dao;

import com.util.JdbcUtil;
import mypage.domain.Basket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class BasketDaoImpl implements BasketDao {

	private static BasketDaoImpl instance = new BasketDaoImpl();

	private BasketDaoImpl() {
	}

	public static BasketDaoImpl getInstance() {
		return instance;
	}

	@Override
	public List<Basket> selectBasket(Connection con, long mid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ltb_basket WHERE me_id = ?";
		List<Basket> basketlist = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, mid);

			rs = pstmt.executeQuery();

			if (rs.next()) {
				basketlist = new ArrayList<>();
				do {
					basketlist.add(new Basket(mid, rs.getLong("ps_id"), rs.getInt("bk_amount")));
				} while (rs.next());
			}
		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return basketlist;
	}

	@Override
	public int plusAmount(Connection conn, long mid, long psid) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "UPDATE ltb_basket SET bk_amount = bk_amount+1 WHERE me_id = ? and ps_id= ?";
		int rowCount = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, mid);
			pstmt.setLong(2, psid);

			rowCount = pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}

		return rowCount;
	}
	
	@Override
	public int minusAmount(Connection conn, long mid, long psid) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "UPDATE ltb_basket SET bk_amount = bk_amount-1 WHERE me_id = ? and ps_id= ?";
		int rowCount = 0;

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setLong(1, mid);
			pstmt.setLong(2, psid);

			rowCount = pstmt.executeUpdate();

		} finally {
			JdbcUtil.close(pstmt);
		}

		return rowCount;
	}
	
	@Override
	public int deleteBasket(Connection conn, long mid, List<Long> psidlist) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM ltb_basket WHERE me_id = ? and ps_id= ?";
		int rowCount = 0;
		
		try {
			Iterator<Long> iterator = psidlist.iterator();
			while(iterator.hasNext()) {
				long psid = iterator.next();
				pstmt = conn.prepareStatement(sql);
				pstmt.setLong(1, mid);
				pstmt.setLong(2, psid);
				rowCount += pstmt.executeUpdate();
			}

		} finally {
			JdbcUtil.close(pstmt);
		}

		return rowCount;
	}
}
