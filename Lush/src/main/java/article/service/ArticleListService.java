package article.service;

import java.sql.Connection;
import java.sql.SQLException;
//import java.util.Collections;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
//import com.util.JdbcUtil;
import com.util.JdbcUtil;

import article.dao.ArticleDao;
import article.dao.ArticleDaoImpl;
import article.domain.Article;
//import event.dao.EventDao;
//import event.dao.EventDaoImpl;
//import event.domain.Event;
import event.exception.EventListEmptyException;
//import event.service.EventListService;

// 싱글톤


public class ArticleListService {
    private static ArticleListService instance = new ArticleListService();
    private ArticleListService(){}
    public static ArticleListService getInstance(){return instance;}

    public List<Article> selectArticleList(int articleStatus, int currentPage, int numberPerPage){
        Connection conn = null;
        ArticleDao dao = ArticleDaoImpl.getInstance();
        List<Article> articles = null;

        try {
            conn = ConnectionProvider.getConnection();
            articles = dao.selectArticleList(conn, articleStatus, currentPage, numberPerPage);
            if (articles == null){
                throw new EventListEmptyException("이벤트 목록이 비어있습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EventListEmptyException e) {
            e.printStackTrace();
        }finally {
            JdbcUtil.close(conn);
        }
        return articles;
    }

    public List<Article> searchArticleList(int categoryLink, int currentPage, int numberPerPage, int searchCondition, String searchWord){
        Connection conn = null;

        List<Article> list = null;
        try {
            conn = ConnectionProvider.getConnection();
            ArticleDao dao = ArticleDaoImpl.getInstance();
            list = dao.searchArticleList(conn, categoryLink, currentPage, numberPerPage, searchCondition, searchWord);
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
            ArticleDao dao = ArticleDaoImpl.getInstance();
            return dao.getPages(conn, numberPerPage, categoryLink);
        } catch (NamingException | SQLException e) {
            throw new RuntimeException(e);
        } finally {
            JdbcUtil.close(conn);
        }
    }
}
/*
public class ArticleListService {
	
	private static ArticleListService instance = new ArticleListService();
    private ArticleListService(){}
    public static ArticleListService getInstance(){return instance;}

    public List<Article> selectArticleList(){
        Connection conn = null;
        ArticleDao dao = ArticleDaoImpl.getInstance();
        List<Article> articles = null;

        try {
            conn = ConnectionProvider.getConnection();
            articles = dao.selectArticleList(conn);
            if (articles == null){
                throw new EventListEmptyException("이벤트 목록이 비어있습니다.");
            }
        } catch (NamingException | SQLException e) {
            e.printStackTrace();
        } catch (EventListEmptyException e) {
            e.printStackTrace();
        }
        return articles;
    }
    */
	/*
	private static ArticleListService  instance = null;
	   
	   private ArticleListService() {}
	   
	   public static ArticleListService getInstance() {
	      if(   instance == null ) {
	         instance = new ArticleListService();
	      }
	      return instance;
	   }

	   // 한 페이지에 출력할 방명록 수 
	   private static final int ARTICLE_COUNT_PER_PAGE = 6;
	   
	   // MessageListView [방명록 목록 + 페이징 처리] 반환하는 메서드
	   public  ArticleListView getArticleList( int pageNumber ) {
	      
	      Connection conn = null;      
	      int currentPageNumber = pageNumber;

	      try {          
	         // DBCP   conn
	         conn = ConnectionProvider.getConnection();          
	         // DAO
	         ArticleDaoImpl articleDao = ArticleDaoImpl.getInstance();

	         // 총 방명록 수
	         int articleTotalCount = articleDao.selectCount(conn);

	         List<Article> articleList = null;

	         int firstRow = 0;
	         int endRow = 0;

	         if ( articleTotalCount > 0 ) {
	            firstRow =   (pageNumber - 1) * ARTICLE_COUNT_PER_PAGE + 1;
	            endRow   = firstRow + ARTICLE_COUNT_PER_PAGE - 1;
	            //      dao.selectList()     해당 페이지의 방명록을 select
	            articleList =         articleDao.selectList(conn, firstRow, endRow);
	         } else {
	            currentPageNumber = 0;
	            articleList = Collections.emptyList();  // 
	         }


	         return new ArticleListView(
	               articleList,
	               articleTotalCount
	               , currentPageNumber,
	               ARTICLE_COUNT_PER_PAGE
	               , firstRow, endRow);

	      } catch (SQLException | NamingException e) {
	         throw new ServiceException("> 목록 구하기 실패: " );
	      } finally {
	         try {
	            conn.close();  // 커넥션 풀 반환
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }  
	      }
	      
	   } // getMessageList

	   public Article getArticle(int articleId) {
	      Connection  conn = null; 
	      try {
	         conn = ConnectionProvider.getConnection();
	         ArticleDaoImpl articleDao = ArticleDaoImpl.getInstance();      
	         
	         return  articleDao.select(conn, articleId); // DI
	         
	      } catch (Exception e) {
	         throw new ServiceException("메세지 구하기 실패 ");
	      }finally {
	         JdbcUtil.close(conn);
	      }
	   }
	   */

