package product.dao;

import product.domian.Basket;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface BasketDao {

    public int insert(Connection conn, Basket baskets) throws SQLException;

    public int selectAmount(Connection conn, Basket basket) throws SQLException;

    public int update(Connection conn, Basket basket, int amount) throws SQLException;
}
