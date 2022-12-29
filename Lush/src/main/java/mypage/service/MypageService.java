package mypage.service;

import com.util.ConnectionProvider;

import mypage.domain.JinhangSum;
import mypage.domain.Member;
import mypage.exception.EmptyException;
import mypage.dao.JinhangSumDao;
import mypage.dao.JinhangSumDaoImpl;
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
    
    public JinhangSum selectJinhangSum(long mid){
        Connection conn = null;
        JinhangSumDao dao = JinhangSumDaoImpl.getInstance();
        JinhangSum jinhangsum = null;
        
        try {
            conn = ConnectionProvider.getConnection();
            jinhangsum = dao.selectJinhangSum(conn, mid);
            if (jinhangsum == null){
                throw new EmptyException("주문 상태 불러오기 실패.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EmptyException e) {
            e.printStackTrace();
        }
        
        return jinhangsum;
    }
    


}
