package managerOrder.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;
import managerOrder.domain.ManOrder;

public interface ManOrderDAO {
	
	public List<ManOrder> selectOrderList(Connection conn, int currentPage, int numberPerPage) throws SQLException;

    public List<ManOrder> searchOrderList(Connection conn, int currentPage, int numberPerPage, int condition, String key) throws SQLException;

    public int getPages(Connection conn, int numberPerPage) throws SQLException;



}
