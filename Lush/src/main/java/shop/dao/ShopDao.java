package shop.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import shop.domain.Shop;

public interface ShopDao {
	
	public List<Shop> selectShopList(Connection conn, int currentPage, int numberPerPage ) throws SQLException;

	public List<Shop> searchShopList(Connection conn, int currentPage, int numberPerPage, int searchCondition, String searchWord ) throws SQLException;

    public int getTotalPages(Connection conn, int numberPerPage) throws SQLException;

    public int getProceedTotalRecords(Connection conn) throws Exception;

    public int getEndTotalRecords(Connection conn) throws Exception;
}
