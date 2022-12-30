package order.dao;

import order.domain.ProductOrder;

import java.sql.Connection;
import java.sql.SQLException;

public interface ProductOrderDao {

    public long getOrderNum(Connection con) throws SQLException;
    public int addOrder(Connection con, ProductOrder productorder) throws SQLException;
}
