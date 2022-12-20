package member.service;

import com.util.ConnectionProvider;

import member.domain.Member;
import member.exception.MemberEmptyException;
import member.dao.MemberDao;
import member.dao.MemberDaoImpl;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;


public class MemberService {
    private static MemberService instance = new MemberService();
    private MemberService(){}
    public static MemberService getInstance(){return instance;}

    public Member selectMember(){
        Connection conn = null;
        MemberDao dao = MemberDaoImpl.getInstance();
        Member member = null;
        String sid = "test1";
        
        try {
            conn = ConnectionProvider.getConnection();
            member = dao.selectMember(conn, sid);
            if (member == null){
                throw new MemberEmptyException("멤버가 없습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (MemberEmptyException e) {
            e.printStackTrace();
        }
        
        return member;
    }
}
