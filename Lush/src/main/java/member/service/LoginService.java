package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

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
				if(member == null) { // 회원이 없으면 
					throw new LoginFailException();
				}
				if(!member.matchPassword(password)) { // 패스워드가 맞지 않으면
					throw new LoginFailException();
		} //if
				return new User(member.getMe_loginid(), member.getMe_name());
	}catch(SQLException | NamingException e) {
		throw new RuntimeException(e);
	}
	}
}