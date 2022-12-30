
package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import member.dao.FindDAO;
import member.dao.FindDAOImpl;
import member.domain.Member;
import member.domain.User;

public class FindIdService {

	FindDAO findDao = FindDAOImpl.getInstance();

	public Member findid(String name, String email) {
		
		Connection conn = null; 
		
		try {
			
			conn =  ConnectionProvider.getConnection();
			
			Member member = findDao.findId(conn, name, email);
			if(member == null ){  // 멤버가 없습니다
				// 메시지 띄우며 
				return null;
			}
			
			System.out.println("service - member 객체 생성");
			
			return new Member(member.getMe_name(), member.getMe_email(), member.getMe_loginid());
		}catch(SQLException | NamingException e) {
			throw new RuntimeException(e);
		}

		}
	}
