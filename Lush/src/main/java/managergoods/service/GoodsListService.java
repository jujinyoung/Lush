package managergoods.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;
import event.exception.EventListEmptyException;
import managergoods.dao.ManGoodsDAO;
import managergoods.dao.ManGoodsImpl;
import managergoods.domain.ManagerGoods;

public class GoodsListService {
	
	private static GoodsListService instance = new GoodsListService();
    private GoodsListService(){}
    public static GoodsListService getInstance(){return instance;}

    public List<ManagerGoods> selectGoodsList(int categoryLink, int currentPage, int numberPerPage){
        Connection conn = null;
        ManGoodsDAO dao = ManGoodsImpl.getInstance();
        List<ManagerGoods> goods = null;

        try {
            conn = ConnectionProvider.getConnection();
            goods = dao.selectGoodsList(conn, categoryLink, currentPage, numberPerPage);
            if (goods == null){
                throw new EventListEmptyException("이벤트 목록이 비어있습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EventListEmptyException e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
        return goods;
    }

    public List<ManagerGoods> searchGoodsList(int categoryLink, int currentPage, int numberPerPage, int searchCondition, String searchWord){
        Connection conn = null;

        List<ManagerGoods> list = null;
        try {
            conn = ConnectionProvider.getConnection();
            ManGoodsDAO dao = ManGoodsImpl.getInstance();
            list = dao.searchGoodsList(conn, categoryLink, currentPage, numberPerPage, searchCondition, searchWord);
        } catch (NamingException | SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(conn);
        }
        return list;
    }
    

    public int getTotalPages(int numberPerPage, int categoryLink){
        Connection conn = null;

        try {
            conn = ConnectionProvider.getConnection();
            ManGoodsDAO dao = ManGoodsImpl.getInstance();
            return dao.getPages(conn, numberPerPage, categoryLink);
        } catch (NamingException | SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(conn);
        }
    }
    


}
