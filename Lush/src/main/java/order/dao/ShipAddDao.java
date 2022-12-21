package order.dao;

import order.domain.ShipAdd;

import java.sql.Connection;
import java.sql.SQLException;

public interface ShipAddDao {

    public ShipAdd selectShipAdd(Connection con, Long mid) throws SQLException;
}
