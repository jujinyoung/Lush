package mypage.dao;

import order.domain.ProductOrder;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface ProductOrderDao {

    public List<Long> getIdList(Connection con, long mid) throws SQLException;
}
