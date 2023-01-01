package notice.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import notice.dao.INotice;
import notice.dao.NoticeImpl;
import notice.domain.Notice;

public class NoticeViewService {
	private static NoticeViewService instance = new NoticeViewService();
	private NoticeViewService() {}
	public static NoticeViewService getInstance() { return instance; }
	
	INotice noticeDao = NoticeImpl.getInstance();
	
	public Notice viewNotice(int n_nid) {
		Connection conn = null;
		Notice viewContent = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			viewContent = noticeDao.view(conn, n_nid);
		}catch(NamingException | SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		return viewContent;
	}
}
