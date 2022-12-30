package managerpage.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import com.util.JdbcUtil;

import managerpage.domain.Member;

public class ManageImpl implements ManageDao {

	//싱글톤
		private static ManageImpl instance = new ManageImpl();
	    private ManageImpl(){}
	    public static ManageImpl getInstance(){
	    	return  instance;
	    	}
	
	//목록
	@Override
	public List<Member> selectManagerList(Connection conn, int categoryLink, int currentPage, int numberPerPage) throws SQLException {
		int begin = (currentPage-1)*numberPerPage + 1;
        int end = begin + numberPerPage - 1;

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " SELECT a.* " +
                     " FROM( " +
                     " SELECT ROWNUM no, t.* " +
                     " FROM( " +
   		             " SELECT * FROM ltb_member " +
        			 " ORDER BY me_id ASC " +
        			 " )t " +
        			 " )a "+
        			 " WHERE a.no BETWEEN ? and ? ";

        List<Member> list = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, begin);
            pstmt.setInt(2, end);
            rs = pstmt.executeQuery();

            if (rs.next()){
                list = new ArrayList<>();
                do {
                	list.add(
                			 new Member(  
                					 	 rs.getInt("me_id"),
                					     rs.getString("me_pass"), 
                					     rs.getString("me_name"), 
                					     rs.getString("me_add"), 
                					     rs.getString("me_tel"), 
                					     rs.getString("me_email"), 
                					     rs.getString("me_nick"),
                					     rs.getString("me_loginid")));
                	
                }while (rs.next());
            }
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return list;
    }

	@Override
	public List<Member> searchManagerList(Connection conn, int categoryLink, int currentPage, int numberPerPage, int condition, String key) throws SQLException {
		
		PreparedStatement pstmt = null;
        ResultSet rs = null;

        int begin = (currentPage-1)*numberPerPage + 1;
        int end = begin + numberPerPage - 1;

        String sql = " SELECT b.* FROM( " +
                     " SELECT ROWNUM no, t.* FROM( " +
        		     " SELECT * FROM ltb_member ";        
        if(condition ==1) sql += " WHERE REGEXP_LIKE(me_name, ?, 'i') ";
        else sql += " WHERE REGEXP_LIKE(me_email, ?, 'i') ";
        sql += " ORDER BY me_id DESC)t)b WHERE b.no BETWEEN ? AND ?";

        List<Member> list = null;
        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, key);
            pstmt.setInt(2, begin);
            pstmt.setInt(3, end);
            rs = pstmt.executeQuery();
            if (rs.next()){
                list = new ArrayList<>();
                do {
                	list.add(
               			 new Member(  
               					     rs.getInt("me_id"),
               					     rs.getString("me_pass"), 
               					     rs.getString("me_name"), 
               					     rs.getString("me_add"), 
               					     rs.getString("me_tel"), 
               					     rs.getString("me_email"), 
               					     rs.getString("me_nick"),
               					     rs.getString("me_loginid")));
                }while (rs.next());
            }
            return list;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }

	@Override
	public int getPages(Connection conn, int numberPerPage, int categoryLink) throws SQLException {
		// TODO Auto-generated method stub
		PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT CEIL(COUNT(*)/?) FROM ltb_member";

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, numberPerPage);
            rs = pstmt.executeQuery();
            int result = 0;
            if (rs.next()){
                result = rs.getInt(1);
            }
            return result;
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
    }
	@Override
	public String getNum(Connection conn, int meID) throws SQLException {
		PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT * FROM ltb_member where me_id=?";
        try {
        	pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, meID);
            rs = pstmt.executeQuery();
            String num = null;
            if(rs.next()) {
            	num = rs.getString(1);
            }
            return num;
        }finally {
        	JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
	}

	/*
	private static ManageImpl instance = new ManageImpl();
    private ManageImpl(){}
    public static ManageImpl getInstance(){
    	return  instance;
    	}
	
	public List<Member> allInfo(Connection conn){
		
		List<Member> members = new ArrayList<Member>();
		PreparedStatement pstmt = null;
        ResultSet rs = null;
        
        String sql = "SELECT * FROM ltb_member";
        try {
        	pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            while(rs.next()) {
            	Member member = new Member();
            	member.setMe_id(rs.getInt("me_id"));
            	member.setMe_pass(rs.getString("me_pass"));
            	member.setMe_name(rs.getString("me_name"));
            	member.setMe_add(rs.getString("me_add"));
            	member.setMe_tel(rs.getString("me_tel"));
            	member.setMe_email(rs.getString("me_email"));
            	member.setMe_nick(rs.getString("me_nick"));
            	member.setMe_loginid(rs.getString("me_loginid"));
            	members.add(member);
            }
        }catch(Exception e) {
        	e.printStackTrace();
        }finally {
        	JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }
		return members;
	}
	*/

}
