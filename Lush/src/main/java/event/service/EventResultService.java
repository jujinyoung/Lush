package event.service;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import event.dao.EventDAO;
import event.dao.EventDAOImpl;
import event.dao.EventResultDAO;
import event.dao.EventResultDAOImpl;
import event.domain.EventResult;
import event.domain.EventResultTitle;
import event.exception.EventNotFoundException;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public class EventResultService {

    private static EventResultService instance = new EventResultService();
    private EventResultService(){}
    public static EventResultService getInstance(){return  instance;}

    EventResultDAO eventResultDAO = EventResultDAOImpl.getInstance();
    EventDAO eventDAO = EventDAOImpl.getInstance();

    public ArrayList<EventResultTitle> selectEventList(int currentPage, int numberPerPage){

        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            ArrayList<EventResult> erlists = eventResultDAO.selectList(conn, currentPage, numberPerPage);
            ArrayList<EventResultTitle> list = null;
            if (erlists != null){
                list = new ArrayList<>();
                for (EventResult erlist:erlists) {
                    String title = eventDAO.getTitle(conn, erlist.getEv_id());
                    if (title==null) throw new EventNotFoundException(erlist.getEv_id()+"번호인 이벤트가 존재하지 않습니다.");
                    list.add(new EventResultTitle(erlist, title));
                }
            }
            return list;
        }catch (EventNotFoundException e){
            e.printStackTrace();
        } catch (SQLException |NamingException e){
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }

        return null;
    }

    public int getTotalRecords(){

        Connection conn = null;
        try {
            conn = ConnectionProvider.getConnection();
            return eventResultDAO.getTotalRecords(conn);
        }catch (Exception e){
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }

        return 0;
    }
}
