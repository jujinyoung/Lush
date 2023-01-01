package notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.DateFormmater;
import com.util.JdbcUtil;

import notice.domain.Recruit;

public class RecruitImpl implements IRecruit{

	private RecruitImpl() {}
	private static RecruitImpl instance = null;
	public static IRecruit getInstance() {
		if(instance == null) {
			instance = new RecruitImpl();
		}
		return instance;
	}

	@Override
	public List<Recruit> selectRecruitList(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = " select rec_id, rec_title, rec_date  "
				+ " from ltb_recruit "
				+ " order by rec_date desc, rec_id desc ";
		
		/* to_char(rec_date, 'yyyy-MM-dd HH24:mi:ss') as rec_date */

		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			List<Recruit> list = null;

			if(rs.next()) {
				 list = new ArrayList<>();
				do {
					Recruit content = new Recruit();
					content.setRec_id(rs.getInt("rec_id"));
					content.setRec_title(rs.getString("rec_title"));
					content.setRec_date(rs.getDate("rec_date"));
					list.add(content);
				}while(rs.next());
				
				return list;
			}
		}catch(Exception e) {
			System.out.println("selectRecruitList,,," + e.toString());
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}

		return null;
	}

	@Override
	public int increaseHits(Connection conn, int rec_id) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = " update ltb_recruit set rec_hits = rec_hits+1 where rec_id =? ";

		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, rec_id);
		int rowCount = pstmt.executeUpdate();

		JdbcUtil.close(pstmt);
		return rowCount;
	}

	@Override
	public Recruit view(Connection conn, int rec_id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select rec_title, rec_date, rec_hits, rec_writer, rec_content "
				+ " from ltb_recruit where rec_id=? ";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, rec_id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				Recruit content = new Recruit();
				do {
					content.setRec_title(rs.getString("rec_title"));
					content.setRec_writer(rs.getString("rec_writer"));
					content.setRec_date(rs.getDate("rec_date"));
					content.setRec_hits(rs.getInt("rec_hits"));
					content.setRec_content(rs.getString("rec_content"));
				}while(rs.next());
				return content;		
			}
		}catch(Exception e) {
			System.out.println("veiwNotice,,," + e.toString());
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return null;

	}

}
