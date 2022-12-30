package product.dao;

import order.domain.ProductSangse;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface ProductSangseDao {

    public ProductSangse selectProductSangseById(Connection conn, int productID) throws SQLException;

    public ArrayList<ProductSangse> selectSangseList(Connection conn, int productID) throws SQLException;
}
