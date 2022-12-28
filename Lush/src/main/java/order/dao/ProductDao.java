package order.dao;

import order.domain.Product;

import java.sql.Connection;
import java.sql.SQLException;

public interface ProductDao {

    public Product selectProduct(Connection con, Long pid) throws SQLException;
}
