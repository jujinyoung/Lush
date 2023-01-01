package notice.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import notice.domain.Notice;

public interface INotice {
	// 공지사항 목록보기
	public List<Notice> selectNoticeList(Connection conn) throws SQLException;
	
	// 공지사항 조회수 증가
	int increaseHits(Connection conn, int n_nid) throws SQLException;
	// 공지사항 글 읽기
	Notice view(Connection conn, int n_nid) throws SQLException;
	
}
