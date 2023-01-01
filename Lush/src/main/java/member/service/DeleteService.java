package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import member.dao.MemDAO;
import member.dao.MemberImpl;
import member.domain.Member;

public class DeleteService {

	MemDAO memDao = MemberImpl.getInstance();
	
	public void deleteinfo(String id) {
		 Connection conn = null;
		 
		 try {
			 conn = ConnectionProvider.getConnection();
			 conn.setAutoCommit(false);
			System.out.println(" deleteservice");
			
		
			  Member member = new Member( id );
			 memDao.delete(conn, member);
			 
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
