package categories.dao;

import categories.domain.Categories;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

public interface CategoriesDao {

    public ArrayList<Categories> selectByCategories1(Connection conn, String categories1) throws SQLException;

    public String findCategories1(Connection conn, int categoriesID) throws SQLException;

    public Categories selectCategoriesById(Connection conn, int categoriesID) throws SQLException;
}
