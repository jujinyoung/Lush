package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;

import com.util.ConnectionProvider;

import member.dao.MemberDao;
import member.domain.Member;
import member.domain.User;
import member.exception.LoginFailException;

public class LoginService { // 로그인 

	
	private MemberDao memberDao = new MemberDao();
	
	public User login(String id, String password) {
		try( 
				Connection conn = ConnectionProvider.getConnection()){
				Member member = memberDao.selectById(conn, id);
				// 패스워드가 맞지 않거나 아이디가 잘못되면 
				// ID 또는 비밀번호를 다시 확인해 주시기 바랍니다.
				if(member == null || !member.matchPassword(password ) ){ 
					return null;
				}

				return new User(member.getMe_loginid(), member.getMe_name());
	}catch(SQLException | NamingException e) {
		throw new RuntimeException(e);
	}
	}
}




/*if(!member.matchPassword(password)) { // 패스워드가 맞지 않으면
*/			// response.sendRedirect("LoginError.jsp"); 
	/*
	 * String path = "LoginError.jsp"; RequestDispatcher dispatcher =
	 * request.getRequestDispatcher(path) ; request.sendre
	 */
//		error
//	} //if