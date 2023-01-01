package order.dao;

import order.domain.ProductPay;

import java.sql.Connection;
import java.sql.SQLException;

public interface ProductPayDao {

    public int addPay(Connection con, ProductPay productpay) throws SQLException;
}
