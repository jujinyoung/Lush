package notice.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import inquiry.service.ServiceException;
import notice.dao.INotice;
import notice.dao.NoticeImpl;
import notice.domain.Notice;

public class NoticeListService {
	
	private static NoticeListService instance = new NoticeListService();
	private NoticeListService() {}
	public static NoticeListService getInstance() {return instance;}
	
	INotice noticeDao = NoticeImpl.getInstance();
	
	public List<Notice> selectNoticeList(){
		Connection conn = null;
		List<Notice> notices = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			notices = noticeDao.selectNoticeList(conn);
			if(notices == null) {
				throw new ServiceException("공지사항이 없습니다.");
			}
		}catch(NamingException | SQLException e) {
			e.printStackTrace();
		}catch(ServiceException e) {
			e.printStackTrace();
		}finally {	JdbcUtil.close(conn);
		}
		return notices;
	}

}
