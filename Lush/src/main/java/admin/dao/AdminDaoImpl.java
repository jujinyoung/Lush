package admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.util.JdbcUtil;

import admin.domain.Admin;


public class AdminDaoImpl implements AdminDao {

    // 싱글톤 선언
    private static AdminDaoImpl instance = new AdminDaoImpl();

    private AdminDaoImpl() {
    }

    public static AdminDaoImpl getInstance() {
        return instance;
    }


    public Admin idcheck(Connection conn, int id) {
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql =
                "select * from ltb_admin where adm_id = ?";

        Admin admin = null;

        System.out.println("admin idcheck 실행");

        try {
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, id);
            rs = pstmt.executeQuery();
            System.out.println("AdminDaoImpl.idcheck");
            //   int adm_id, String adm_pw, String adm_name
            if (rs.next()) {
                admin = new Admin(

                        rs.getInt("adm_id"),
                        rs.getString("adm_pw"),
                        rs.getString("adm_name")

                );
                System.out.println("admin 객체 생성 완료");
            }
            System.out.println("admin idcheck 실행 완료");
            return admin;

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(rs);
            JdbcUtil.close(pstmt);
        }
        return null;


    }
}
