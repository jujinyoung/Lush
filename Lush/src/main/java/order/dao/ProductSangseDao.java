package order.dao;

import order.domain.ProductSangse;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface ProductSangseDao {

    public ProductSangse selectProductSangse(Connection con, Long pid, int weight) throws SQLException;
    public long selectProductSangseId(Connection con, Long pid, int weight) throws SQLException;
    public List<Long> getAmountList(Connection con, List<Long> psidlist) throws SQLException;
    public int minusAmount(Connection con, List<Long> psidlist, List<Long> customeramountlist) throws SQLException;
    public int plusAmount(Connection con, List<Long> psidlist, List<Long> customeramountlist) throws SQLException;
    public int plusTrade(Connection con, List<Long> pdidlist, List<Long> customeramountlist) throws SQLException;

    
}
