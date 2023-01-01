package member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.util.JdbcUtil;

import member.domain.Member;

public class MemberImpl implements MemDAO {
	
	// 싱글톤 선언
		private static MemberImpl instance = new MemberImpl();
		private MemberImpl() {}
		public static MemberImpl getInstance() {
			return instance;
		}
		
		@Override
		public int insert(Connection conn, Member mem) throws SQLException{ // 회원가입
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "insert into ltb_member values (seq_ltb_member.NEXTVAL , ?, ?, ? , ? , ?, ?, ? )";
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, mem.getMe_pass() );
				pstmt.setString(2, mem.getMe_name() );
				pstmt.setString(3, mem.getMe_add() );
				pstmt.setString(4, mem.getMe_tel() );                                            
				pstmt.setString(5, mem.getMe_email() ); 
				pstmt.setString(6, mem.getMe_nick() );
    			pstmt.setString(7, mem.getMe_loginid() );
				
    			
    			int result = pstmt.executeUpdate();
    		
    			return result; 
    			// 정상 가입시 1 return 
	
			
		} finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

    }
		
		@Override
		public void uppass(Connection conn, Member member) throws SQLException{ 
			
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "update ltb_member set me_pass = ? where me_loginid= ?";
			
			try {
				
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, member.getMe_pass());
				System.out.println( member.getMe_pass());
				pstmt.setString(2, member.getMe_loginid());
				System.out.println("memberdao");
				pstmt.executeUpdate();
				
    
			
		} finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

    }
		
		
		@Override
		public void upinfo(Connection conn, Member member) throws SQLException{ 
			//String nick, String email, String tel, String add, String loginid
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			System.out.println("memberdao - upinfo 실행 ");
			
			String sql = "update ltb_member set me_nick = ?, me_email = ?,me_tel = ?, me_add =  ? where me_loginid= ?";
			
			try {
				System.out.println("memberdao - update info1");
				pstmt = conn.prepareStatement(sql);
				//Member member = new Member();
				System.out.println("memberdao - update info2");// 여기까지 실행 
				pstmt.setString(1, member.getMe_nick());
				
				System.out.println(member.getMe_nick()); 
				
				pstmt.setString(2, member.getMe_email());
				
				System.out.println(member.getMe_email()); 
				pstmt.setString(3, member.getMe_tel());
				
				System.out.println("memberdao - update info5");
				pstmt.setString(4, member.getMe_add());
				pstmt.setString(5, member.getMe_loginid());
				System.out.println("memberdao - update info4");
				
				pstmt.executeUpdate();
				
    
			
		} catch(SQLException e){
			 e.printStackTrace();
		}catch (Exception e) {
			 e.printStackTrace();
		}
			
			finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

    }
		@Override
		public void delete(Connection conn, Member member) throws SQLException{
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "delete from  LTB_MEMBER where me_loginid = ?";

			try {	
				pstmt = conn.prepareStatement(sql);
				
				pstmt.setString(1, member.getMe_loginid());
		
				System.out.println("memberdao");
				pstmt.executeUpdate();
				
    
			
		} finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
		}
		
		
}