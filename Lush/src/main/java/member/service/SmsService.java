package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import member.dao.FindDAO;
import member.dao.FindDAOImpl;
import member.domain.Member;

public class SmsService {

	FindDAO findDao = FindDAOImpl.getInstance();
	
	public Member memeixst(String id) {
		try( 
				Connection conn = ConnectionProvider.getConnection()){
				Member member = findDao.passmember(conn, id);
					//	memberDao.passmember(conn, id);
				
				if(member == null ){ 
	
					return null;
				}
				

				
				System.out.println("sms service - 객체 생성");
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
	
}
