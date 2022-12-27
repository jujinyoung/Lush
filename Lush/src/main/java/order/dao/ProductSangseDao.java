package order.dao;

import order.domain.ProductSangse;

import java.sql.Connection;
import java.sql.SQLException;

public interface ProductSangseDao {

    public ProductSangse selectProductSangse(Connection con, Long pid, int weight) throws SQLException;
}
