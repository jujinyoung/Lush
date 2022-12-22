package shop.dao;

import java.sql.SQLException;
import java.util.ArrayList;

public interface ShopDao {
	
	ArrayList<ShopDto> select( int currentPage, int numberPerPage ) throws SQLException;
}
