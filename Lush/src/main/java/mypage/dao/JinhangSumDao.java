package mypage.dao;

import java.sql.Connection;
import java.sql.SQLException;

import mypage.domain.JinhangSum;

public interface JinhangSumDao {

    public JinhangSum selectJinhangSum(Connection con, long mid) throws SQLException;
//    public int addShipAdd(Connection con, ShipAdd shipadd) throws SQLException;
//    public int updateShipAdd(Connection con, long mid) throws SQLException;
//    public long selectShipId(Connection con, Long mid) throws SQLException;
}
