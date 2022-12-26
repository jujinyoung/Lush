package order.dao;

import order.domain.ProductSangse;

import java.sql.Connection;
import java.sql.SQLException;

public interface ProductSangseDAO {

    public ProductSangse selectProductSangse(Connection con, Long psid) throws SQLException;
}