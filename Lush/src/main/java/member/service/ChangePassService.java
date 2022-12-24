
package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import member.dao.MemberDao;
import member.domain.Member;

public class ChangePassService {

	MemberDao memberDao = new MemberDao();
	
	// 아이디 입력 -> 비밀번호 찾기 버튼 -> 멤버가 있는지 확인 
	public Member isMemhere(String id, String email) {
		try( 
				Connection conn = ConnectionProvider.getConnection()){
				Member member = memberDao.isMatchpass(conn, id, email);
				
				if(member == null ){ 
					return null;
				}
				

				
				System.out.println("비밀번호 변경 - member 객체 생성");
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

