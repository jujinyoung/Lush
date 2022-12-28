package product.dao;

import order.domain.ProductSangse;

import java.sql.Connection;
import java.sql.SQLException;

public interface ProductSangseDao {

    public ProductSangse selectProductSangseById(Connection conn, int productID) throws SQLException;
}
