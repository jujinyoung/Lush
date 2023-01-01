package notice.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import event.exception.EventListEmptyException;
import inquiry.service.ServiceException;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import notice.dao.IRecruit;
import notice.dao.RecruitImpl;
import notice.domain.Recruit;

public class RecruitListService {

	private static RecruitListService instance = new RecruitListService();
	private RecruitListService() {}
	public static RecruitListService getInstance() {return instance;}
	
	IRecruit recruitDao = RecruitImpl.getInstance();
	
	public List<Recruit> selectRecruitList(){
		Connection conn = null;
		List<Recruit> recruits = null;
		try {
			conn = ConnectionProvider.getConnection();
			recruits = recruitDao.selectRecruitList(conn);
			if(recruits == null) {
				throw new ServiceException("채용 게시글이 없습니다.");
			}
		}catch(NamingException | SQLException e) {
			e.printStackTrace();
		}catch(ServiceException e) {
			e.printStackTrace();
		}finally {	JdbcUtil.close(conn);
		} return recruits;
	}
	
	
/*	public JSONArray selectRecruitList(){
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			List<Recruit> recruits = recruitDao.selectRecruitList(conn);

			JSONArray jsonArray = null;
			
			if(!recruits.isEmpty()) {
				
				jsonArray = new JSONArray();
				JSONObject jsonObject = new JSONObject();
				for(Recruit recruit: recruits) {
					jsonObject.put("recruit", recruit);
					jsonArray.add(jsonObject);
				}
				
			}
			
			return jsonArray;
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
		return null;
	}*/
}
