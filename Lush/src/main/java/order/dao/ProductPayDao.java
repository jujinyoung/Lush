package order.dao;

import order.domain.ShipAdd;

import java.sql.Connection;
import java.sql.SQLException;

public interface ProductPayDao {

    public ShipAdd selectShipAdd(Connection con, Long mid) throws SQLException;
    public int addShipAdd(Connection con, ShipAdd shipadd) throws SQLException;
    public int updateShipAdd(Connection con, ShipAdd shipadd) throws SQLException;
}
