package article.dao;


import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import article.domain.Article;

public interface ArticleDao {

	
	
	public List<Article> selectArticleList(Connection conn, int categoryLink, int currentPage, int numberPerPage) throws SQLException;

    public List<Article> searchArticleList(Connection conn, int categoryLink ,int currentPage, int numberPerPage, int condition, String key) throws SQLException;

    public int getPages(Connection conn, int numberPerPage, int categoryLink) throws SQLException;
    
    public String getNum(Connection conn, int stID) throws SQLException;
    
/*	
 * 
 * List<Article> selectArticleList(Connection con) throws SQLException;
 * 
 * 
	// 1.글쓰기
	int insert( Connection con, Article article) throws SQLException;
	// 2.총 게시글 수를 반환하는 메서드
	int selectCount(Connection con)  throws SQLException;
	// 3.목록
	List<Article> selectList( Connection con, int firstRow, int endRow ) throws SQLException;
	// 4.보기
	Article select( Connection con, long st_id) throws SQLException;
	// 5.삭제
	int delete( Connection con, long st_id ) throws SQLException;
	// 6. 방명록 수정
	int update( Connection con, Article article ) throws SQLException;
	List<Article> selectArticleList(Connection conn);

*/

}
