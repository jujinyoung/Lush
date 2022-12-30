package inquiry.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import inquiry.dao.IInquiry;
import inquiry.dao.InquiryImpl;
import inquiry.domain.Inquiry;

public class InquiryViewService {
	
	private static InquiryViewService instance = new InquiryViewService();
	private InquiryViewService() {}
	public static InquiryViewService getInstance() {
		return instance;
	}
	
	IInquiry inquiryDao = InquiryImpl.getInstance();
	
	public Inquiry view(int q_qid) {
		Connection conn = null;
		Inquiry viewContent = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			viewContent = inquiryDao.view(conn, q_qid);
			
		}catch(NamingException | SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		return viewContent;
	}
	
}
