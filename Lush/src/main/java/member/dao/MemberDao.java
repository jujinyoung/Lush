
package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import member.domain.Member;

public class MemberDao {
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	Connection conn;
	
	public Member selectById(Connection conn, String me_loginid) throws SQLException {
		// member 테이블에서 id컬럼이 id 파라미터와 동일한 값을 조회 

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
			System.out.println("멤버 객체 생성");
			}
		System.out.println("selectbyid 실행 다 함");
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
	
	public Member isMatchpass(Connection conn, String me_loginid, String me_email) throws SQLException {
		// member 테이블에서 id컬럼과 email이 정확하게 일치하는 멤버가 있는지 조회

		pstmt = conn.prepareStatement(
				"select * from ltb_member where me_loginid = ? and me_email = ?"
				);
		pstmt.setString(1, me_loginid);
		pstmt.setString(2, me_email);

		System.out.println("아이디/이메일 매치 멤버 찾기 실행");
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
		System.out.println("비번 변경 - 멤버 객체 생성");
					return member;
				
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	public Member passmember(Connection conn, String me_loginid) throws SQLException {
		// member 테이블에서 id컬럼과 email이 정확하게 일치하는 멤버가 있는지 조회

		pstmt = conn.prepareStatement(
				"select * from ltb_member where me_loginid = ?"
				);
		pstmt.setString(1, me_loginid);

		System.out.println("아이디/이메일 매치 멤버 찾기 실행");
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
		System.out.println("비번 변경 - 멤버 객체 생성");
					return member;
				
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
	}
	
	
//	최종
	
	public void uppass(Connection conn, Member member) throws SQLException{
		try(
			PreparedStatement pstmt = conn.prepareStatement(
			"update ltb_member set me_pass = ? where me_loginid= ?"	
			)){
			pstmt.setString(1, member.getMe_pass());
			pstmt.setString(2, member.getMe_loginid());
			System.out.println("memberdao");
			pstmt.executeUpdate();
			
			
		}
		
	}
	
	
	
	public int checkId(Connection conn, String id) {  // 아이디 중복체크
		int idCheck = 0;
		System.out.println("memdao checkid 실행");
		
	  try {
		pstmt = conn.prepareStatement(
				"select * from ltb_member where me_loginid = ?"
				);
		pstmt.setString(1, id);

		
		System.out.println("아이디 중복체크");
		rs = pstmt.executeQuery();
					
		if(rs.next() || id.equals("")) {
				idCheck = 0;  // 이미 존재하는 경우, 생성 불가능
			} else {
				idCheck = 1;  // 존재하지 않는 경우, 생성 가능
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		return idCheck;
	}
	
}
