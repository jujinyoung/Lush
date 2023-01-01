package notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import notice.domain.Notice;

public class NoticeImpl implements INotice{
	
	private NoticeImpl() {}
	private static NoticeImpl instance = null;
	public static INotice getInstance() {
		if(instance == null) {
			instance = new NoticeImpl();
		}
		return instance;
	}
	
	// 공지사항 목록보기
	@Override
	public List<Notice> selectNoticeList(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select n_nid, n_title, n_date, n_num "
				+ " from ltb_notice "
				+ " order by decode(n_num, 1, 1), n_date desc ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				List<Notice> list = new ArrayList<Notice>();
				do {
					Notice content = new Notice();
					content.setN_nid(rs.getInt("n_nid"));
					content.setN_title(rs.getString("n_title"));
					content.setN_date(rs.getDate("n_date"));
					content.setN_num(rs.getInt("n_num"));
					list.add(content);
					
				}while(rs.next());
				return list;
			}
			
		}catch(Exception e) {
			System.out.println("selectNoticeList,,," + e.toString());
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return null;
	}  // selectNoticeList
	
	// 공지사항 조회수 증가
	@Override
	public int increaseHits(Connection conn, int n_nid) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = " update ltb_notice set n_hits = n_hits+1 where n_nid =? ";
		
		pstmt = conn.prepareStatement(sql);
		pstmt.setInt(1, n_nid);
		int rowCount = pstmt.executeUpdate();
		
		JdbcUtil.close(pstmt);
		return rowCount;
	}  // increaseHits

	// 공지사항 읽기
	@Override
	public Notice view(Connection conn, int n_nid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select n_title, n_date, n_hits, n_writer, n_content "
				+ " from ltb_notice where n_nid=? ";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, n_nid);
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				Notice content = new Notice();
				do {
					content.setN_title(rs.getString("n_title"));
					content.setN_date(rs.getDate("n_date"));
					content.setN_hits(rs.getInt("n_hits"));
					content.setN_writer(rs.getString("n_writer"));
					content.setN_content(rs.getString("n_content"));
					
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
