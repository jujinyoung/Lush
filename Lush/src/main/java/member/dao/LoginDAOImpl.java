package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.JdbcUtil;

import member.domain.Member;

public class LoginDAOImpl implements LoginDAO{

	// 싱글톤 선언
	private static LoginDAOImpl instance = new LoginDAOImpl();
	private LoginDAOImpl() {}
	public static LoginDAOImpl getInstance() {
		return instance;
	}
	
	
	@Override
	public Member selectid(Connection conn, String loginid) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = 
				"select * from ltb_member where me_loginid = ?";
		
		Member member = null;
		
	

		System.out.println("selectbyid 실행");
		
		try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, loginid);
	         rs = pstmt.executeQuery();
			
			// 존재한다면 member 객체 생성
		if(rs.next()) {
			member = new Member(
				
			  rs.getString("me_nick"), 
			  rs.getString("me_email"), 
			  rs.getString(" me_tel"),
			  rs.getString("me_add"), 
			  rs.getString("me_loginid")
			 );
			System.out.println("selectid 멤버 객체 생성 완료");
			}
			System.out.println("selectid 실행 완료");
					return member;
				
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		
	}
	
	@Override
	public Member selectById(Connection conn, String loginid) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = 
				"select * from ltb_member where me_loginid = ?";
		
		Member member = null;
		
	

		System.out.println("selectbyid 실행");
		
		try {
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, loginid);
	         rs = pstmt.executeQuery();
			
			// 존재한다면 member 객체 생성
		if(rs.next()) {
			member = new Member(
				rs.getInt("me_id"),
			  rs.getString("me_pass"), 
			  rs.getString("me_name"), 
			  rs.getString("me_add"),
			  rs.getString("me_tel"), 
			  rs.getString("me_email"), 
			  rs.getString("me_nick"),
			  rs.getString("me_loginid")
			 );
			System.out.println("멤버 객체 생성");
			}
			System.out.println("selectbyid 실행 완료");
					return member;
				
		} finally {
			JdbcUtil.close(rs);
			JdbcUtil.close(pstmt);
		}
		
		
	}
	
	
	
}
