package member.dao;

import java.sql.Connection;
import java.sql.SQLException;

import member.domain.Member;

public interface FindDAO {

	public Member findId(Connection conn, String name, String email) throws SQLException;
	
	public Member passmember(Connection conn, String loginid) throws SQLException;

	int checkId(Connection conn, String id);
	
	public Member isMatchpass(Connection conn, String loginid, String email) throws SQLException;
	
	
	
}
