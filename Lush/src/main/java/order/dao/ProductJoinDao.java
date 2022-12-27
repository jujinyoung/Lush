package order.dao;

import order.domain.ProductJoin;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface ProductJoinDao {

    public  List<ProductJoin> selectProductJoin(Connection con, Long pid, int amount2) throws SQLException;
}
