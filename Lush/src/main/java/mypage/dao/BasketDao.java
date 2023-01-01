package mypage.dao;

import mypage.domain.Basket;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public interface BasketDao {
    
    public List<Basket> selectBasket(Connection conn, long mid) throws SQLException;
    public int plusAmount(Connection conn, long mid, long psid) throws SQLException;
    public int minusAmount(Connection conn, long mid, long psid) throws SQLException;
    public int deleteBasket(Connection conn, long mid, List<Long> psidlist) throws SQLException;
}
