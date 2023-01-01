package admin.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import admin.dao.AdminDao;
import admin.dao.AdminDaoImpl;
import admin.domain.Admin;


public class AdLoginService {
	
	AdminDao adminDao = AdminDaoImpl.getInstance();
	
	public Admin login(int id, String password) {
		
		 Connection conn = null;
		 
			try { 
				conn = ConnectionProvider.getConnection();
				
				Admin admin = adminDao.idcheck(conn, id);
						
				System.out.println("admin login admin 선언");
				
			//	System.out.println( admin.getAdm_id()  );
				
				if(admin == null || !admin.matchPassword(password ) ){ 
					System.out.println("matchPassword");
					return null;
				}

				return new Admin( admin.getAdm_id(), admin.getAdm_pw() );
				}catch(SQLException | NamingException e) {
						throw new RuntimeException(e);
					}finally {
			            JdbcUtil.close(conn);
			        }
			}
	}
