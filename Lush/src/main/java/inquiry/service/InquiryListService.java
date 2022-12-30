package inquiry.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import inquiry.dao.IInquiry;
import inquiry.dao.InquiryImpl;
import inquiry.domain.Inquiry;

public class InquiryListService {

	private static InquiryListService instance = new InquiryListService();
	private InquiryListService() {}
	public static InquiryListService getInstance() {
		return instance;
	}
	
	IInquiry inquiryDao = InquiryImpl.getInstance();
	
	public List<Inquiry> selectEventList(int me_id){
		Connection conn = null;
		List<Inquiry> inquirys = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			inquirys = inquiryDao.selectInquiryList(conn, me_id);
			if(inquirys == null) {
				throw new ServiceException("문의 목록이 없습니다.");
			}
		}catch(NamingException | SQLException e) {
			e.printStackTrace();
		}catch(ServiceException e) {
			e.printStackTrace();
		}finally {	JdbcUtil.close(conn);
		}
		return inquirys;
		}
		
	}


