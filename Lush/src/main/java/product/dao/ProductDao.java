package product.dao;

import product.domian.Product;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface ProductDao {

    public int getProductCategoriesRecord(Connection conn, int categoriesID) throws SQLException;

    public ArrayList<Product> productList(Connection conn, ArrayList<Integer> categoriesID, int selectStatus, int currentPage, int numberPerPage) throws SQLException;

    public int plusReview(Connection conn, int productID, int count) throws SQLException;

    public int minusReview(Connection conn, int productID, int count) throws SQLException;

    public int countReview(Connection conn, int productID) throws SQLException;

    public Product selectProduct(Connection conn, int productID) throws SQLException;

    public int getTotalRecords(Connection conn, ArrayList<Integer> categoriesID) throws SQLException;
}
