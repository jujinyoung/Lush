package order.service;

import com.util.ConnectionProvider;

import order.domain.Member;
import order.domain.Product;
import order.domain.ProductSangse;
import order.domain.ShipAdd;
import order.exception.EmptyException;
import order.dao.MemberDao;
import order.dao.MemberDaoImpl;
import order.dao.ProductDao;
import order.dao.ProductDaoImpl;
import order.dao.ProductSangseDao;
import order.dao.ProductSangseDaoImpl;
import order.dao.ShipAddDao;
import order.dao.ShipAddDaoImpl;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;


public class OrderService {
    private static OrderService instance = new OrderService();
    private OrderService(){}
    public static OrderService getInstance(){return instance;}

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
