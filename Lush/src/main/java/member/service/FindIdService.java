package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import member.dao.MemberDao;
import member.domain.Member;
import member.domain.User;

public class FindIdService {

	MemberDao memberDao = new MemberDao();

	public Member findid(String name, String email) {
		try( 
				Connection conn = ConnectionProvider.getConnection()){
				Member member = memberDao.findId(conn, name, email);
				if(member == null ){ 
					return null;
				}
				System.out.println("service - member 객체 생성");
				return new Member(member.getMe_name(), member.getMe_email(), member.getMe_loginid());
	}catch(SQLException | NamingException e) {
		throw new RuntimeException(e);
	}

	}
}
