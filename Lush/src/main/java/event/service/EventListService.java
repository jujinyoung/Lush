package event.service;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import event.dao.EventDAO;
import event.dao.EventDAOImpl;
import event.domain.Event;
import event.exception.EventListEmptyException;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public class EventListService {
    private static EventListService instance = new EventListService();
    private EventListService(){}
    public static EventListService getInstance(){return instance;}

    EventDAO eventDao = EventDAOImpl.getInstance();

    public List<Event> selectEventList(int eventStatus, int currentPage, int numberPerPage){
        Connection conn = null;
        List<Event> events = null;

        try {
            conn = ConnectionProvider.getConnection();
            events = eventDao.selectEventList(conn, eventStatus, currentPage, numberPerPage);
            if (events == null){
                throw new EventListEmptyException("이벤트 목록이 비어있습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EventListEmptyException e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
        return events;
    }

    public List<Event> searchEventList(int eventStatus, int currentPage, int numberPerPage, int searchCondition, String searchWord){
        Connection conn = null;

        List<Event> list = null;
        try {
            conn = ConnectionProvider.getConnection();

            list = eventDao.searchEventList(conn, eventStatus, currentPage, numberPerPage, searchCondition, searchWord);
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn);
        }
        return list;
    }

    public int getTotalPages(int numberPerPage, int eventStatus){
        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();
            return eventDao.getTotalPages(conn, numberPerPage, eventStatus);
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn);
        }
        return 1;
    }

    public int getProceedRecords(){
        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();
            return eventDao.getProceedTotalRecords(conn);
        }catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn);
        }

        return 0;
    }

    public int getEndRecords(){
        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();
            return eventDao.getEndTotalRecords(conn);
        }catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn);
        }

        return 0;
    }
}
