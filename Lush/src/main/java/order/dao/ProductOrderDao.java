package order.dao;

import order.domain.ProductOrder;
import order.domain.ProductOrderDetails;
import order.domain.ProductPay;

import java.sql.Connection;
import java.sql.SQLException;

public interface ProductOrderDao {

    public long getOrderNum(Connection con) throws SQLException;
    public int addOrder(Connection con, ProductOrder productorder, ProductOrderDetails productorderdetails, ProductPay productpay) throws SQLException;
}
