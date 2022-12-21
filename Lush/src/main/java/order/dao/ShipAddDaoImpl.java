package order.dao;

import com.util.JdbcUtil;

import order.domain.Member;
import order.domain.ShipAdd;

import java.sql.*;


public class ShipAddDaoImpl implements ShipAddDao{

    private static ShipAddDaoImpl instance = new ShipAddDaoImpl();
    private ShipAddDaoImpl(){}
    public static ShipAddDaoImpl getInstance(){return  instance;}
    @Override
    public ShipAdd selectShipAdd(Connection con, Member member ) throws SQLException {

        PreparedStatement pstmt = null;
        ResultSet rs = null;
        String sql = "SELECT * FROM ltb_shipAdd WHERE me_id = ? and ship_default = ? ";
        ShipAdd shipadd = null;
        
        try {
            pstmt = con.prepareStatement(sql);
            pstmt.setLong(1, member.getMid());
            pstmt.setString(2, "1");
            
            rs = pstmt.executeQuery();
            
            if (rs.next()){

                do { shipadd = new ShipAdd(rs.getLong("sh_id"), rs.getString("sh_add"), rs.getString("sh_name"), 
                		rs.getString("sh_orderer"), rs.getString("sh_tel"), rs.getString("sh_phone"), 
                		rs.getString("ship_default"), rs.getLong("me_id"));
                }while (rs.next());
            }

            
        }finally {
            JdbcUtil.close(pstmt);
            JdbcUtil.close(rs);
        }

        return shipadd;
    }

}