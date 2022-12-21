package order.dao;

import order.domain.Member;
import order.domain.ShipAdd;

import java.sql.Connection;
import java.sql.SQLException;

public interface ShipAddDao {

    public ShipAdd selectShipAdd(Connection con, Member member) throws SQLException;
}
