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
				pstmt.setString(2, member.getMe_loginid());
				System.out.println("memberdao");
				pstmt.executeUpdate();
				
    
			
		} finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

    }
}