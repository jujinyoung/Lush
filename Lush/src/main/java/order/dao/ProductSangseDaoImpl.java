package order.dao;

import com.util.JdbcUtil;

import order.domain.ProductSangse;

import java.sql.*;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ProductSangseDaoImpl implements ProductSangseDao {

	private static ProductSangseDaoImpl instance = new ProductSangseDaoImpl();

	private ProductSangseDaoImpl() {
	}

	public static ProductSangseDaoImpl getInstance() {
		return instance;
	}

	@Override
	public ProductSangse selectProductSangse(Connection con, Long pid, int weight) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM ltb_ps WHERE pd_id = ? and ps_weight = ?";
		ProductSangse productsangse = null;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pid);
			pstmt.setLong(2, weight);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				do {
					productsangse = new ProductSangse(rs.getLong("ps_id"), rs.getLong("ps_weight"),
							rs.getLong("ps_price"), rs.getLong("pd_id"), rs.getLong("ps_amount"));
				} while (rs.next());
			}

		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}

		return productsangse;
	}

	@Override
	public long selectProductSangseId(Connection con, Long pid, int weight) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ps_id FROM ltb_ps WHERE pd_id = ? and ps_weight = ?";
		long psid = 0;

		try {
			pstmt = con.prepareStatement(sql);
			pstmt.setLong(1, pid);
			pstmt.setLong(2, weight);

			rs = pstmt.executeQuery();

			if (rs.next()) {

				do {
					psid = (rs.getLong("ps_id"));
				} while (rs.next());
			}

		} finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}

		return psid;
	}

	@Override
	public List<Long> getAmountList(Connection con, List<Long> psidlist) throws SQLException {

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT ps_amount FROM ltb_ps WHERE ps_id = ? ";
		List<Long> amountlist = null;

		try {
			Iterator<Long> iterator = psidlist.iterator();
			amountlist = new ArrayList<>();
			while (iterator.hasNext()) {
				Long psid = iterator.next();
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, psid);

				rs = pstmt.executeQuery();
				if (rs.next()) {
					
					do {
						amountlist.add(rs.getLong("ps_amount"));
					} while (rs.next());
				}
			}

		} finally {
			JdbcUtil.close(pstmt);
		}

		return amountlist;
	}

	@Override
	public int minusAmount(Connection con, List<Long> psidlist, List<Long> customeramountlist) throws SQLException {

		PreparedStatement pstmt = null;
		String sql = "UPDATE ltb_ps SET ps_amount = ps_amount - ? WHERE  ps_id = ?";
		int rowCount = 0;

		try {
			for (int i = 0; i < psidlist.size(); i++) {
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, customeramountlist.get(i));
				pstmt.setLong(2, psidlist.get(i));
				rowCount += pstmt.executeUpdate();
			}

		} finally {
			JdbcUtil.close(pstmt);
		}

		return rowCount;
	}
	
	@Override
	public int plusAmount(Connection con, List<Long> psidlist, List<Long> customeramountlist) throws SQLException {

		PreparedStatement pstmt = null;
		String sql = "UPDATE ltb_ps SET ps_amount = ps_amount + ? WHERE  ps_id = ?";
		int rowCount = 0;

		try {
			for (int i = 0; i < psidlist.size(); i++) {
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, customeramountlist.get(i));
				pstmt.setLong(2, psidlist.get(i));
				rowCount += pstmt.executeUpdate();
			}

		} finally {
			JdbcUtil.close(pstmt);
		}

		return rowCount;
	}
	
	@Override
	public int plusTrade(Connection con, List<Long> pdidlist, List<Long> customeramountlist) throws SQLException {

		PreparedStatement pstmt = null;
		String sql = "UPDATE ltb_product SET pd_trade = pd_trade + ? WHERE  pd_id = ?";
		int rowCount = 0;

		try {
			for (int i = 0; i < pdidlist.size(); i++) {
				pstmt = con.prepareStatement(sql);
				pstmt.setLong(1, customeramountlist.get(i));
				pstmt.setLong(2, pdidlist.get(i));
				rowCount += pstmt.executeUpdate();
			}

		} finally {
			JdbcUtil.close(pstmt);
		}

		return rowCount;
	}

}