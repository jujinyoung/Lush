package order.service;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import order.dao.MemberDao;
import order.dao.MemberDaoImpl;
import order.dao.ProductOrderDao;
import order.dao.ProductOrderDaoImpl;
import order.dao.ProductOrderDetailsDao;
import order.dao.ProductOrderDetailsDaoImpl;
import order.dao.ProductPayDao;
import order.dao.ProductPayDaoImpl;
import order.dao.ProductSangseDao;
import order.dao.ProductSangseDaoImpl;
import order.dao.ShipAddDao;
import order.dao.ShipAddDaoImpl;
import order.domain.Member;
import order.domain.ProductOrder;
import order.domain.ProductOrderDetails;
import order.domain.ProductPay;
import order.domain.ProductSangse;
import order.exception.EmptyException;
import order.exception.OrderException;

import javax.naming.NamingException;
import java.sql.Connection;
import java.sql.SQLException;


public class OrderService {
    private static OrderService instance = new OrderService();
    private OrderService(){}
    public static OrderService getInstance(){return instance;}
    
    ProductOrderDao orderdao = ProductOrderDaoImpl.getInstance();
    ProductOrderDetailsDao orderdetailsdao = ProductOrderDetailsDaoImpl.getInstance();
    ProductPayDao paydao = ProductPayDaoImpl.getInstance();

    public int addOrder(ProductOrder productorder, ProductOrderDetails productorderdetails, ProductPay productpay){
        Connection conn = null;
        int rowCount1 = 0;
        int rowCount2 = 0;
        int rowCount3 = 0;
        
        try {
            conn = ConnectionProvider.getConnection();
            conn.setAutoCommit(false);
            
            rowCount1 = orderdao.addOrder(conn, productorder);
            if (rowCount1 == 0){
                throw new OrderException("주문 넣기 실패!");
            }
            rowCount2 = orderdetailsdao.addOrderDetails(conn, productorderdetails);
            if (rowCount2 == 0){
                throw new OrderException("주문상세 넣기 실패!");
            }
            rowCount3 = paydao.addPay(conn, productpay);
            if (rowCount3 == 0){
                throw new OrderException("결제 넣기 실패!");
            }
            
            conn.commit();
        } catch (NamingException | SQLException e) {
        	JdbcUtil.rollback(conn);
            e.printStackTrace();
        } catch (Exception e) {
        	JdbcUtil.rollback(conn);
            e.printStackTrace();
        }
        
        return rowCount3;
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
