package product.dao;

import com.util.JdbcUtil;
import order.domain.ProductSangse;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductSangseDaoImpl implements ProductSangseDao {

    private static ProductSangseDaoImpl instance = new ProductSangseDaoImpl();
    private ProductSangseDaoImpl(){}
    public static ProductSangseDaoImpl getInstance(){return  instance;}


    @Override
    public ProductSangse selectProductSangseById(Connection conn, int productID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT ps_id, pd_id, ps_weight, ps_price " +
                ", (SELECT SUM(ps_amount) FROM ltb_ps WHERE pd_id=?) ps_amount FROM ltb_ps " +
                "WHERE ps_price = " +
                "(SELECT MIN(ps_price) FROM ltb_ps WHERE pd_id=?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productID);
            pstmt.setInt(2, productID);
            rs = pstmt.executeQuery();
            ProductSangse sangse = null;
            if (rs.next()){
                sangse = new ProductSangse(rs.getInt("ps_id"), rs.getInt("ps_weight"), rs.getInt("ps_price"), rs.getInt("pd_id"), rs.getInt("ps_amount"));
            }

            return sangse;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }
}