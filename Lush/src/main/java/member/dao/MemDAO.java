package member.dao;

import java.sql.Connection;
import java.sql.SQLException;

import member.domain.Member;

public interface MemDAO {

	// 회원가입
	public int insert(Connection conn, Member mem) throws SQLException;
	
	// 비밀번호 변경
	public void uppass(Connection conn, Member member) throws SQLException;

	// 회원정보 업데이트
	public void upinfo(Connection conn, Member member) throws SQLException;
	
	// 회원 삭제 
	public void delete(Connection conn, Member member) throws SQLException;

	
}
