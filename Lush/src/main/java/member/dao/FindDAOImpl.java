package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.JdbcUtil;

import member.domain.Member;

public class FindDAOImpl implements FindDAO {
	
	// 싱글톤 선언
			private static FindDAOImpl instance = new FindDAOImpl();
			private FindDAOImpl() {}
			public static FindDAOImpl getInstance() {
				return instance;
			}
			
			// 아이디 찾기 
			@Override
			public Member findId(Connection conn, String name, String email) throws SQLException{
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from ltb_member where me_name = ? and me_email = ?";
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, name);
					pstmt.setString(2, email);
					
					System.out.println("findId 실행");
					
					rs = pstmt.executeQuery();
					Member member = null;
					
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
			
			
			// 아이디 - 이메일 매치 멤버 존재 확인
			@Override
			public Member passmember(Connection conn, String loginid) throws SQLException{
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from ltb_member where me_loginid = ?";
				
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, loginid);
				
					System.out.println("passmember 실행");
					
					rs = pstmt.executeQuery();
					Member member = null;
					
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
			
			
			@Override
			public int checkId(Connection conn, String id){
				
				int idCheck = 0;
				System.out.println("memdao checkid 실행");
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from ltb_member where me_loginid = ?";
				
				try {
					pstmt = conn.prepareStatement(sql);
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
				
			
			
			// 비밀번호 찾기
			@Override
			public Member isMatchpass(Connection conn, String loginid, String email) throws SQLException{
				// member 테이블에서 id컬럼과 email이 정확하게 일치하는 멤버가 있는지 조회
				
				System.out.println("isMatchpass 실행");
				
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from ltb_member where me_loginid = ? and me_email = ?";
				
				try {
					pstmt = conn.prepareStatement(sql);
					pstmt.setString(1, loginid);
					pstmt.setString(2, email);

					
					rs = pstmt.executeQuery();
					
					Member member = null;
					
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
							
					}catch (SQLException e) {
						e.printStackTrace();
					} finally {
						JdbcUtil.close(rs);
						JdbcUtil.close(pstmt);
					}
				return null;
					
				
			} // 
}// class