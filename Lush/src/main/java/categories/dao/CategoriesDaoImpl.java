package categories.dao;

import com.util.JdbcUtil;
import categories.domain.Categories;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CategoriesDaoImpl implements CategoriesDao{

    private static CategoriesDaoImpl instance = new CategoriesDaoImpl();
    private CategoriesDaoImpl(){}
    public static CategoriesDaoImpl getInstance(){return  instance;}

    @Override
    public ArrayList<Categories> selectByCategories1(Connection conn, String categories1) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_categories WHERE pc_cate1=? ORDER BY pc_order";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, categories1);
            rs = pstmt.executeQuery();
            ArrayList<Categories> list = null;
            if (rs.next()){
                list = new ArrayList<>();
                do {
                    list.add(new Categories(rs.getInt("pc_id"), rs.getString("pc_cate1"), rs.getString("pc_cate2")));
                }while (rs.next());
            }

            return list;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public String findCategories1(Connection conn, int categoriesID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT pc_cate1 FROM ltb_categories WHERE pc_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, categoriesID);
            rs = pstmt.executeQuery();
            String categories1 = null;
            if (rs.next()){
                categories1 = rs.getString(1);
            }

            return categories1;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public Categories selectCategoriesById(Connection conn, int categoriesID) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_categories WHERE pc_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, categoriesID);
            rs = pstmt.executeQuery();
            Categories categories = null;
            if (rs.next()){
                categories = new Categories(rs.getInt("pc_id"), rs.getString("pc_cate1"), rs.getString("pc_cate2"));
            }

            return categories;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }
}
