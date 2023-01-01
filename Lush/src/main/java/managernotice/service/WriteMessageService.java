package managernotice.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.ConnectionProvider;

import article.service.ServiceException;
import managernotice.dao.ManNoticeImpl;
import managernotice.domain.ManNotice;

public class WriteMessageService {

	// 1. 싱글톤 
	   private static WriteMessageService instance = new WriteMessageService();
	   private WriteMessageService() { }
	   public static WriteMessageService getInstance() {
	      return instance;
	   }   

	   // 2. 
	   public int write(ManNotice notice) {
	      Connection con = null;
	      int rowCount = 0;

	      try {
	         con = ConnectionProvider.getConnection();
	         ManNoticeImpl dao = ManNoticeImpl.getInstance();

	         rowCount = dao.insert(con, notice);

	      } catch (Exception e) { 
	         throw new ServiceException("> 메시지 등록 실패 : " + e.getMessage(), e);
	      } finally {
	         try {
	            con.close();
	         } catch (SQLException e) { 
	            e.printStackTrace();
	         }
	      }
	      return rowCount;
	   }
	}