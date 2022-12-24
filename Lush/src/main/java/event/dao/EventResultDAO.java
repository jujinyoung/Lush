package event.dao;

import event.domain.EventResult;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface EventResultDAO {

    public ArrayList<EventResult> selectList(Connection conn, int currentPage, int numberPerPage) throws SQLException;

    public int getTotalRecords(Connection conn) throws SQLException;
}
