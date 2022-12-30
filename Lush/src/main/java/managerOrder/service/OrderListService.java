package managerOrder.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import event.exception.EventListEmptyException;
import managerOrder.dao.ManOrderDAO;
import managerOrder.dao.ManOrderImpl;
import managerOrder.domain.ManOrder;

public class OrderListService {

	private static OrderListService instance = new OrderListService();
    private OrderListService(){}
    public static OrderListService getInstance(){return instance;}

    public List<ManOrder> selectOrderList(int currentPage, int numberPerPage){
        Connection conn = null;
        ManOrderDAO dao = ManOrderImpl.getInstance();
        List<ManOrder> orders = null;

        try {
            conn = ConnectionProvider.getConnection();
            orders = dao.selectOrderList(conn, currentPage, numberPerPage);
            if (orders == null){
                throw new EventListEmptyException("이벤트 목록이 비어있습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EventListEmptyException e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
        return orders;
    }

    public List<ManOrder> searchOrderList(int currentPage, int numberPerPage, int searchCondition, String searchWord){
        Connection conn = null;

        List<ManOrder> list = null;
        try {
            conn = ConnectionProvider.getConnection();
            ManOrderDAO dao = ManOrderImpl.getInstance();
            list = dao.searchOrderList(conn, currentPage, numberPerPage, searchCondition, searchWord);
        } catch (NamingException | SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(conn);
        }
        return list;
    }

    public int getTotalPages(int numberPerPage){
        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();
            ManOrderDAO dao = ManOrderImpl.getInstance();
            return dao.getPages(conn, numberPerPage);
        } catch (NamingException | SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(conn);
        }
    }
}