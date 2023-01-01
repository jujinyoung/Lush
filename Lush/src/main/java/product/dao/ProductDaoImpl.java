package product.dao;

import com.util.DateFormmater;
import com.util.JdbcUtil;
import product.domian.Product;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ProductDaoImpl implements ProductDao{

    private static ProductDaoImpl instance = new ProductDaoImpl();
    private ProductDaoImpl(){}
    public static ProductDaoImpl getInstance(){return  instance;}

    @Override
    public int getProductCategoriesRecord(Connection conn, int categoriesID) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT COUNT(*) FROM ltb_product WHERE pc_id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, categoriesID);
            rs = pstmt.executeQuery();
            int result = 0;
            if (rs.next()) result = rs.getInt(1);

            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public ArrayList<Product> productList(Connection conn, ArrayList<Integer> categoriesID, int selectStatus, int currentPage, int numberPerPage) throws SQLException {

        int begin = (currentPage-1)*numberPerPage + 1;
        int end = begin + numberPerPage - 1;

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT b.* FROM ( " +
                " SELECT ROWNUM no, t.* FROM ( " +
                " SELECT * FROM ltb_product " +
                " WHERE pc_id IN (? ";

        for (int i=1; i<categoriesID.size(); i++){
            sql += ",?";
        }
        sql+=" ) ";
        sql+="ORDER BY ";
        switch (selectStatus){
            case 1:
                sql += " pd_recommend DESC ";
                break;
            case 2:
                sql += " pd_trade DESC";
                break;
            case 3:
                sql += " pd_price ";
                break;
            case 4:
                sql += " pd_price DESC ";
                break;
            case 5:
                sql += " pd_review DESC ";
        }

        sql+= " )t )b WHERE b.no BETWEEN ? and ?";

        try {
            pstmt = conn.prepareStatement(sql);
            int i;
            for (i=0; i<categoriesID.size(); i++){
                pstmt.setInt((i+1), categoriesID.get(i));
            }
            pstmt.setInt(++i,begin);
            pstmt.setInt(++i,end);

            rs = pstmt.executeQuery();
            ArrayList<Product> list = null;
            if (rs.next()){
                list = new ArrayList<>();
                do {
                    list.add(new Product(rs.getInt("pd_id"), rs.getInt("pc_id"), rs.getString("pd_name"), rs.getString("pd_vegan")
                    , rs.getString("pd_domestic"), rs.getString("pd_cate3"), DateFormmater.sliceDatedd(rs.getDate("pd_rdate")), rs.getString("pd_event")
                    , rs.getString("pd_naked"), rs.getString("pd_curation"), rs.getString("pd_recommend"), rs.getInt("pd_review")
                    , rs.getInt("pd_price"), rs.getInt("pd_trade")));
                }while (rs.next());
            }

            return list;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

    @Override
    public int plusReview(Connection conn, int productID, int count) throws SQLException {
        PreparedStatement pstmt = null;
        String sql = "UPDATE ltb_product SET pd_review=? WHERE pd_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, ++count);
            pstmt.setInt(2, productID);

            return pstmt.executeUpdate();
        }finally {
            JdbcUtil.close(pstmt);
        }
    }

    @Override
    public int minusReview(Connection conn, int productID, int count) throws SQLException {
        PreparedStatement pstmt = null;
        String sql = "UPDATE ltb_product SET pd_review=? WHERE pd_id=?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, --count);
            pstmt.setInt(2, productID);

            return pstmt.executeUpdate();
        }finally {
            JdbcUtil.close(pstmt);
        }
    }

    @Override
    public int countReview(Connection conn, int productID) throws SQLException {
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT pd_review FROM ltb_product WHERE pd_id = ?";
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, productID);
            rs = pstmt.executeQuery();
            int result = 0;
            if (rs.next()) result = rs.getInt(1);

            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }
}
