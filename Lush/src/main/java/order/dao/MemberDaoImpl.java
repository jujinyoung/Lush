package order.dao;

import com.util.JdbcUtil;

import order.domain.Member;

import java.sql.*;


public class MemberDaoImpl implements MemberDao{

    private static MemberDaoImpl instance = new MemberDaoImpl();
    private MemberDaoImpl(){}
    public static MemberDaoImpl getInstance(){return  instance;}
    @Override
    public Member selectMember(Connection con, String sid) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_member WHERE me_loginid = ? ";
        Member member = null;
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, sid);
            rs = pstmt.executeQuery();
            
            if (rs.next()){
                do { member = new Member(rs.getLong("me_id"), rs.getString("me_pass"), rs.getString("me_name"), 
                		rs.getString("me_add"), rs.getString("me_tel"), rs.getString("me_email"), 
                		rs.getString("me_nick"), rs.getString("me_loginid"));
                }while (rs.next());
            }

            
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return member;
    }

}