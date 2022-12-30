package managerpage.dao;

import java.sql.Connection;


import java.sql.SQLException;
import java.util.List;

import managerpage.domain.Member;


public interface ManageDao {
	
	public List<Member> selectManagerList(Connection conn, int categoryLink, int currentPage, int numberPerPage) throws SQLException;

    public List<Member> searchManagerList(Connection conn, int categoryLink, int currentPage, int numberPerPage, int condition, String key) throws SQLException;

    public int getPages(Connection conn, int numberPerPage, int categoryLink) throws SQLException;

    public String getNum(Connection conn, int meID) throws SQLException;
}
