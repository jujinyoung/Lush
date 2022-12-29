package member.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;

import member.dao.FindDAO;
import member.dao.FindDAOImpl;


public class IdCheckService {
	
	FindDAO findDao = FindDAOImpl.getInstance();

	// MemberDao  memberDao = new MemberDao();
	
	public int checkid(String id){
	
		try(
				Connection conn = ConnectionProvider.getConnection()){
				int idch = findDao.checkId(conn, id);
						// memberDao.checkId(conn, id);
				
				if(idch == 1) {
					return 1;
				}else {
					return 0;
				}
				
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (NamingException e) {
			e.printStackTrace();
		}
		return 0;
}
	
	
	
	
	
	
	
}

