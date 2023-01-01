package order.dao;

import order.domain.ProductJoin;
import order.domain.ProductParameter;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

public interface ProductJoinDao {

    public  List<ProductJoin> selectProductJoin(Connection con, List<ProductParameter> productparameterlist) throws SQLException;
    
}
