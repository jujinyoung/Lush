package notice.service;

import java.sql.Connection;
import java.sql.SQLException;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import notice.dao.IRecruit;
import notice.dao.RecruitImpl;
import notice.domain.Recruit;

public class RecruitViewService {

	private static RecruitViewService instance = new RecruitViewService();
	private RecruitViewService() {}
	public static RecruitViewService getInstance() { return instance; }

	IRecruit recruitDao = RecruitImpl.getInstance();

	public Recruit viewRecruit(int rec_id) {
		Connection conn = null;

		Recruit viewContent = null;

		try {
			conn = ConnectionProvider.getConnection();
			viewContent = recruitDao.view(conn, rec_id);
		}catch(NamingException | SQLException e) {
			e.printStackTrace();
		}finally {
			JdbcUtil.close(conn);
		}
		return viewContent;
	}

}
