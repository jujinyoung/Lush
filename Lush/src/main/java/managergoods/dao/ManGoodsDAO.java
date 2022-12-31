package managergoods.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import managergoods.domain.ManagerGoods;

public interface ManGoodsDAO {
	
	public List<ManagerGoods> selectGoodsList(Connection conn, int currentPage, int numberPerPage) throws SQLException;

    public List<ManagerGoods> searchGoodsList(Connection conn, int currentPage, int numberPerPage, int condition, String key) throws SQLException;

    public int getPages(Connection conn, int numberPerPage) throws SQLException;


}
