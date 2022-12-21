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
    
    public ShipAdd selectShipAdd(Long mid){
        Connection conn = null;
        ShipAddDao dao = ShipAddDaoImpl.getInstance();
        ShipAdd shipadd = null;
        

        try {
            conn = ConnectionProvider.getConnection();
            shipadd = dao.selectShipAdd(conn, mid);
            if (shipadd == null){
                throw new EmptyException("배송지가 없습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EmptyException e) {
            e.printStackTrace();
        }
        
        return shipadd;
    }
    
    public Product selectProduct(Long pid){
        Connection conn = null;
        ProductDao dao = ProductDaoImpl.getInstance();
        Product product = null;
        

        try {
            conn = ConnectionProvider.getConnection();
            product = dao.selectProduct(conn, pid);
            if (product == null){
                throw new EmptyException("제품이 없습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EmptyException e) {
            e.printStackTrace();
        }
        
        return product;
    }
    
    public ProductSangse selectProductSangse(Long psid){
        Connection conn = null;
        ProductSangseDao dao = ProductSangseDaoImpl.getInstance();
        ProductSangse productsangse = null;
        

        try {
            conn = ConnectionProvider.getConnection();
            productsangse = dao.selectProductSangse(conn, psid);
            if (productsangse == null){
                throw new EmptyException("제품상세가 없습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EmptyException e) {
            e.printStackTrace();
        }
        
        return productsangse;
    }
    

}
