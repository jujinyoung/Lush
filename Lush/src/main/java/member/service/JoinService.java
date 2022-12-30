
package member.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import event.domain.Event;
import event.exception.EventListEmptyException;
import member.dao.LoginDAO;
import member.dao.LoginDAOImpl;
import member.dao.MemDAO;
import member.dao.MemberImpl;
import member.domain.Member;
import member.exception.DuplicateIdException;

public class JoinService {

	MemDAO memDao = MemberImpl.getInstance();
	LoginDAO loginDao = LoginDAOImpl.getInstance();

	public void join(JoinRequest joinReq) throws DuplicateIdException {
		
		Connection conn = null;
		
		try {
			
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			
			System.out.println("memberdao.insert트랜잭션");
			
			Member member = loginDao.selectById(conn, joinReq.getMe_loginid());
			
			 if(member != null) { // 회원이 이미 존재
				  System.out.println("member != null");
				  JdbcUtil.rollback(conn); // 트랜잭션 롤백 
			  }
			 
			 System.out.println("try 문 나옴");
				//joinreq-> member 객체 생성, memberDAO의 insert 실행 -> 데이터 db에 삽입 
			 memDao.insert(conn, new Member(
								
								joinReq.getMe_pass(),
								joinReq.getMe_name(),
								joinReq.getMe_add(),
								joinReq.getMe_tel(),
								joinReq.getMe_email(),
								joinReq.getMe_nick(),
								joinReq.getMe_loginid()
								
								));
				conn.commit();
				
			//	System.out.println(member.getMe_id());
				
				System.out.println("member.insert 완료");
				
			} catch (SQLException e) {
				
				System.out.println("SQLException");
				JdbcUtil.rollback(conn);
				throw new RuntimeException(e);
			} catch (NamingException e) {
				System.out.println("Namingxception");
				e.printStackTrace();
			}	finally {
				JdbcUtil.close(conn);
			}
		}
	}
		
			
