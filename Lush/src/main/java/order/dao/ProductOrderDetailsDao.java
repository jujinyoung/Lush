package order.dao;

import order.domain.ProductOrderDetails;

import java.sql.Connection;
import java.sql.SQLException;

public interface ProductOrderDetailsDao {

    public int addOrderDetails(Connection con, ProductOrderDetails productorderdetails) throws SQLException;
}
