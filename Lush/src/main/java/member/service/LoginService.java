
package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import member.dao.LoginDAO;
import member.dao.LoginDAOImpl;
import member.domain.Member;
import member.domain.User;


public class LoginService { // 로그인 


	LoginDAO loginDao = LoginDAOImpl.getInstance();
	
	public User login(String id, String password) {
		 Connection conn = null;
		 
		try { 
				conn = ConnectionProvider.getConnection();
				
				Member member = loginDao.selectById(conn, id);
				System.out.println("loginservice member 선언");
				
				System.out.println(member.getMe_pass());
				
				if(member == null || !member.matchPassword(password ) ){ 
					System.out.println("matchPassword");
					return null;
				}

				return new User(member.getMe_loginid(), member.getMe_name(), member.getMe_id());
				}catch(SQLException | NamingException e) {
						throw new RuntimeException(e);
					}finally {
			            JdbcUtil.close(conn);
			        }
			}
}

