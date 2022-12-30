package member.dao;

import java.sql.Connection;
import java.sql.SQLException;

import member.domain.Member;

public interface LoginDAO {
	
	public Member selectById(Connection conn, String loginid) throws SQLException;

	Member selectid(Connection conn, String loginid) throws SQLException;
	
	

}
