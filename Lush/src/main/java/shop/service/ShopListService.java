package shop.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import shop.dao.ShopDao;
import shop.dao.ShopDaoImpl;
import shop.domain.Shop;
import shop.exception.ShopListEmptyException;

public class ShopListService {
	private static ShopListService instance = new ShopListService();
    private ShopListService(){}
    public static ShopListService getInstance(){return instance;}
    
    ShopDao shopDao = ShopDaoImpl.getInstance();
    
    public List<Shop> selectShopList(int currentPage, int numberPerPage){
        Connection conn = null;
        List<Shop> shops = null;

        try {
            conn = ConnectionProvider.getConnection();
            shops = shopDao.selectShopList(conn, currentPage, numberPerPage);
            if (shops == null){
                throw new ShopListEmptyException("매장 목록이 비어있습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (ShopListEmptyException e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
        return shops;
    }
    
    public List<Shop> searchShopList(int currentPage, int numberPerPage, int searchCondition, String searchWord){
        Connection conn = null;
        List<Shop> list = null;
        
        try {
            conn = ConnectionProvider.getConnection();

            list = shopDao.searchShopList(conn, currentPage, numberPerPage, searchCondition, searchWord);
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn);
        }
        return list;
    }
    
    public List<Shop> selectShopView(int currentPage, int numberPerPage, int spId){
        Connection conn = null;
        List<Shop> shops = null;

        try {
            conn = ConnectionProvider.getConnection();
            shops = shopDao.selectShopView(conn, currentPage, numberPerPage, spId);
            if (shops == null){
                throw new ShopListEmptyException("매장 목록이 비어있습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (ShopListEmptyException e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
        return shops;
    }
    
    public int getTotalPages(int numberPerPage){
        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();
            return shopDao.getTotalPages(conn, numberPerPage);
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn);
        }
        return 1;
    }

    public int getProceedRecords(){
        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();
            return shopDao.getProceedTotalRecords(conn);
        }catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn);
        }

        return 0;
    }

    public int getEndRecords(){
        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();
            return shopDao.getEndTotalRecords(conn);
        }catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            JdbcUtil.close(conn);
        }

        return 0;
    }
}
