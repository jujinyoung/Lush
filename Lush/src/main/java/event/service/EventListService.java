package event.service;

import com.util.ConnectionProvider;
import event.dao.EventDao;
import event.dao.EventDaoImpl;
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

    public List<Event> selectEventList(){
        Connection conn = null;
        EventDao dao = EventDaoImpl.getInstance();
        List<Event> events = null;

        try {
            conn = ConnectionProvider.getConnection();
            events = dao.selectEventList(conn);
            if (events == null){
                throw new EventListEmptyException("이벤트 목록이 비어있습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EventListEmptyException e) {
            e.printStackTrace();
        }
        return events;
    }
}
