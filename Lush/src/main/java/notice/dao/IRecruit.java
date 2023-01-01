package notice.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import notice.domain.Recruit;

public interface IRecruit {

	// 직원채용 목록보기
	public List<Recruit> selectRecruitList(Connection conn) throws SQLException;
	
	// 직원채용 조회수 증가
	int increaseHits(Connection conn, int rec_id) throws SQLException;
	// 직원채용 글 읽기
	Recruit view(Connection conn, int rec_id) throws SQLException;
}
