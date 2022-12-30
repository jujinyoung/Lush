package inquiry.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import inquiry.dao.InquiryImpl;
import inquiry.domain.Inquiry;

public class InquiryWriteService {
	
	private static InquiryWriteService instance = new InquiryWriteService();
	private InquiryWriteService() {}
	public static InquiryWriteService getInstance() {
		return instance;
	}
	
	public int writeInquiry(Inquiry inquirydto) throws ServiceException {
		Connection conn = null;
		int rowCount = 0;
		
		try {
			conn = ConnectionProvider.getConnection();
			InquiryImpl inquiryDao = (InquiryImpl) InquiryImpl.getInstance();
			
			rowCount = inquiryDao.insert(conn, inquirydto);
			
		} catch(Exception e){
			throw new ServiceException("문의글 등록 실패,," + e.getMessage(), e);
		}finally {
	         JdbcUtil.close(conn);
	       }
		return rowCount;
	}

}
