package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import member.dao.FindDAO;
import member.dao.FindDAOImpl;
import member.dao.LoginDAO;
import member.dao.LoginDAOImpl;
import member.dao.MemDAO;
import member.dao.MemberImpl;
import member.domain.Member;

public class ChangeInfoService {
	
	FindDAO findDao = FindDAOImpl.getInstance();
	LoginDAO loginDao = LoginDAOImpl.getInstance();
	MemDAO memDao = MemberImpl.getInstance();
	
	// passmember 사용해서 세션 로그인 값에서 아이디 가져와서 멤버 객체 정보 가져옴 
	public Member isMem(String id) {
		try( 
				Connection conn = ConnectionProvider.getConnection()){
				Member member = findDao.passmember(conn, id);
				
				if(member == null ){ 
					return null;
				}
				

				
				System.out.println("비밀번호 변경 전 - member 객체 생성");
				return new Member(
						member.getMe_pass(), 
						member.getMe_name(),
						member.getMe_add(),
						member.getMe_tel(),
						member.getMe_email(),
						member.getMe_nick(),
						member.getMe_loginid()
						
						);
				
	}catch(SQLException | NamingException e) {
		throw new RuntimeException(e);
	}

	}
	
	public void upinfo(String id, String email, String add, String tel, String nick ) {
		
		 Connection conn = null;
		 try {
			 conn = ConnectionProvider.getConnection();
			 conn.setAutoCommit(false);
			System.out.println(" unpinfo ");
			
			System.out.println( "upinfo emiil >" + email );
			// Member member = loginDao.selectById(conn, id);
			  Member member = new Member(nick, email, tel, add, id );
			 memDao.upinfo(conn, member);
			 conn.commit();
	
		 }catch (SQLException | NamingException e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		}catch (Exception e) {
			JdbcUtil.rollback(conn);
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
			
		}
		
	
	
	}
}
