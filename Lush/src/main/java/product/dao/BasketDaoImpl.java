package product.dao;

import com.util.JdbcUtil;
import product.domian.Basket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class BasketDaoImpl implements BasketDao{

    private static BasketDaoImpl instance = new BasketDaoImpl();
    private BasketDaoImpl(){}
    public static BasketDaoImpl getInstance(){return  instance;}

    @Override
    public int insert(Connection conn, Basket basket) throws SQLException {

        PreparedStatement pstmt = null;
        String sql = "INSERT INTO ltb_basket VALUES (ltb_basket_seq.nextval, ?, ?, ?)";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, basket.getMe_id());
            pstmt.setInt(2, basket.getPs_id());
            pstmt.setInt(3, basket.getBk_amount());
            return pstmt.executeUpdate();
        }finally {
            JdbcUtil.close(pstmt);
        }
    }

    @Override
    public int selectAmount(Connection conn, Basket basket) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_basket WHERE me_id = ? and ps_id= ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, basket.getMe_id());
            pstmt.setInt(2, basket.getPs_id());
            rs = pstmt.executeQuery();
            if (rs.next()){
                return rs.getInt("bk_amount");
            }

            return 0;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public int update(Connection conn, Basket basket, int amount) throws SQLException {
        PreparedStatement pstmt = null;
        String sql = "UPDATE ltb_basket SET bk_amount=? WHERE me_id = ? and ps_id= ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, basket.getBk_amount()+amount);
            pstmt.setInt(2, basket.getMe_id());
            pstmt.setInt(3, basket.getPs_id());
            return pstmt.executeUpdate();
        }finally {
            JdbcUtil.close(pstmt);
        }
    }
}
