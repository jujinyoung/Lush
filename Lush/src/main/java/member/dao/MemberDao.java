package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.JdbcUtil;

import member.domain.Member;

public class MemberDao {
	
	
	public Member selectById(Connection conn, String me_loginid) throws SQLException {
		// member 테이블에서 id컬럼이 id 파라미터와 동일한 값을 조회 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(
				"select * from ltb_member where me_loginid = ?");
		pstmt.setString(1, me_loginid);

		System.out.println("selectbyid 실행");
		rs = pstmt.executeQuery();
		Member member = null;
		try {
			// 존재한다면 member객체를 생성-> ?
		if(rs.next()) {
			member = new Member(
					rs.getString("me_pass"),
					rs.getString("me_name"),
					rs.getString("me_add"),
					rs.getString("me_tel"),
					rs.getString("me_email"),
					rs.getString("me_nick"),
					rs.getString("me_loginid"));
			}
		System.out.println("멤버 객체 생성");
					return member;
				
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	public void insert(Connection conn, Member mem) throws SQLException{ // 회원가입
	
		try (
				PreparedStatement pstmt = conn.prepareStatement(
					
						"insert into ltb_member values (seq_ltb_member.NEXTVAL , ?, ?, ? , ? , ?, ?, ? )"
						)){
					pstmt.setString(1, mem.getMe_pass() );
					pstmt.setString(2, mem.getMe_name() );
					pstmt.setString(3, mem.getMe_add() );
					pstmt.setString(4, mem.getMe_tel() );                                            
					pstmt.setString(5, mem.getMe_email() ); 
					pstmt.setString(6, mem.getMe_nick() );
	    			pstmt.setString(7, mem.getMe_loginid() );
					pstmt.executeUpdate();
				
					conn.commit();
				
					System.out.println("insert 실행");
		
		}
	} 
	
	
	
	public Member findId(Connection conn, String name, String email) throws SQLException { // 아이디 찾기
		// member 테이블에서 id컬럼이 id 파라미터와 동일한 값을 조회 
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		pstmt = conn.prepareStatement(
				"select * from ltb_member where me_name = ? and me_email = ?");
		pstmt.setString(1, name);
		pstmt.setString(2, email);

		System.out.println("findId 실행");
		
		rs = pstmt.executeQuery();
		Member member = null;
		try {
			// 존재한다면 member객체를 생성-> ?
		if(rs.next()) {
			member = new Member(
					rs.getString("me_name"),
					rs.getString("me_email"),
					rs.getString("me_loginid"));
			}
		System.out.println("멤버 객체 생성-findid");
					return member;
				
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	
	
}
