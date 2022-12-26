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


public class OrderViewService {
    private static OrderViewService instance = new OrderViewService();
    private OrderViewService(){}
    public static OrderViewService getInstance(){return instance;}

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
    
    public ProductSangse selectProductSangse(Long pid, Long weight){
        Connection conn = null;
        ProductSangseDao dao = ProductSangseDaoImpl.getInstance();
        ProductSangse productsangse = null;
        

        try {
            conn = ConnectionProvider.getConnection();
            productsangse = dao.selectProductSangse(conn, pid, weight);
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
    
    public int addShipAdd(ShipAdd shipadd) {
        Connection conn = null;
        ShipAddDao dao = ShipAddDaoImpl.getInstance();        
        int rowCount = 0;
        
        try {
            conn = ConnectionProvider.getConnection();
            rowCount = dao.addShipAdd(conn, shipadd);
            if (rowCount == 0){
                throw new EmptyException("추가 실패");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EmptyException e) {
            e.printStackTrace();
        }
        
        return rowCount;
    }
    
    public int updateShipAdd(ShipAdd shipadd) {
        Connection conn = null;
        ShipAddDao dao = ShipAddDaoImpl.getInstance();        
        int rowCount = 0;
        
        try {
            conn = ConnectionProvider.getConnection();
            rowCount = dao.updateShipAdd(conn, shipadd);
            if (rowCount == 0){
                throw new EmptyException("업데이트 실패");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EmptyException e) {
            e.printStackTrace();
        }
        
        return rowCount;
    }
    
    
    

}
