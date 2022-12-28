package member.dao;

import java.sql.Connection;
import java.sql.SQLException;

import member.domain.Member;

public interface MemDAO {

	public int insert(Connection conn, Member mem) throws SQLException;
	
	// 비밀번호 변경
	public void uppass(Connection conn, Member member) throws SQLException; 
}
