package event.dao;

import event.domain.Event;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface EventDao {

    public List<Event> selectEventList(Connection con) throws SQLException;
}
