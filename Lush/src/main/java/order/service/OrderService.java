package order.service;

import com.util.ConnectionProvider;

import order.dao.MemberDao;
import order.dao.MemberDaoImpl;
import order.dao.ProductOrderDao;
import order.dao.ProductOrderDaoImpl;

import order.dao.ProductSangseDao;
import order.dao.ProductSangseDaoImpl;
import order.dao.ShipAddDao;
import order.dao.ShipAddDaoImpl;
import order.domain.Member;
import order.domain.ProductOrder;
import order.domain.ProductOrderDetails;
import order.domain.ProductPay;
import order.domain.ProductSangse;
import order.domain.ShipAdd;
import order.exception.EmptyException;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;


public class OrderService {
    private static OrderService instance = new OrderService();
    private OrderService(){}
    public static OrderService getInstance(){return instance;}

    public int addOrder(ProductOrder productorder, ProductOrderDetails productorderdetails, ProductPay productpay){
        Connection conn = null;
        ProductOrderDao orderdao = ProductOrderDaoImpl.getInstance();
        int rowCount = 0;
        
        try {
            conn = ConnectionProvider.getConnection();
            rowCount = orderdao.addOrder(conn, productorder, productorderdetails, productpay);
            if (rowCount == 0){
                throw new EmptyException("주문 실패.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EmptyException e) {
            e.printStackTrace();
        }
        
        return rowCount;
    }
   
    
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

    public ProductSangse selectProductSangse(Long pid, int weight){
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
    
    public long selectShipId(Long mid){
        Connection conn = null;
        ShipAddDao dao = ShipAddDaoImpl.getInstance();
        long shid = 0;

        try {
            conn = ConnectionProvider.getConnection();
            shid = dao.selectShipId(conn, mid);
            if (shid == 0){
                throw new EmptyException("배송지가 없습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EmptyException e) {
            e.printStackTrace();
        }
        
        return shid;
    }
    

    
}
