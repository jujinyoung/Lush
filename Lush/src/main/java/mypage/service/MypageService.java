package mypage.service;

import com.util.ConnectionProvider;

import mypage.domain.Member;
import order.exception.EmptyException;
import mypage.dao.MemberDao;
import mypage.dao.MemberDaoImpl;


import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;


public class MypageService {
    private static MypageService instance = new MypageService();
    private MypageService(){}
    public static MypageService getInstance(){return instance;}

    public Member selectMember(String sid){
        Connection conn = null;
        MemberDao dao = MemberDaoImpl.getInstance();
        Member member = null;
        
        try {
            conn = ConnectionProvider.getConnection();
            member = dao.selectMember(conn, sid);
            if (member == null){
                throw new EmptyException("멤버가 없습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EmptyException e) {
            e.printStackTrace();
        }
        
        return member;
    }
    


}
