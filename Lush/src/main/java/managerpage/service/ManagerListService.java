package managerpage.service;

import java.sql.Connection;

import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import event.exception.EventListEmptyException;
import managerpage.dao.ManageDao;
import managerpage.dao.ManageImpl;
import managerpage.domain.Member;

public class ManagerListService {

	private static ManagerListService instance = new ManagerListService();
    private ManagerListService(){}
    public static ManagerListService getInstance(){return instance;}

    public List<Member> selectManagerList(int categoryLink, int currentPage, int numberPerPage){
        Connection conn = null;
        ManageDao dao = ManageImpl.getInstance();
        List<Member> managers = null;

        try {
            conn = ConnectionProvider.getConnection();
            managers = dao.selectManagerList(conn, categoryLink ,currentPage, numberPerPage);
            if (managers == null){
                throw new EventListEmptyException("이벤트 목록이 비어있습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EventListEmptyException e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
        return managers;
    }

    public List<Member> searchManagerList(int categoryLink, int currentPage, int numberPerPage, int searchCondition, String searchWord){
        Connection conn = null;

        List<Member> list = null;
        try {
            conn = ConnectionProvider.getConnection();
            ManageDao dao = ManageImpl.getInstance();
            list = dao.searchManagerList(conn, categoryLink, currentPage, numberPerPage, searchCondition, searchWord);
        } catch (NamingException | SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(conn);
        }
        return list;
    }

    public int getTotalPages(int numberPerPage, int categoryLink){
        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();
            ManageDao dao = ManageImpl.getInstance();
            return dao.getPages(conn, numberPerPage, categoryLink);
        } catch (NamingException | SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(conn);
        }
    }
}
