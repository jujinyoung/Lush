package article.dao;

import com.util.JdbcUtil;
import article.domain.Article;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

/*import java.text.SimpleDateFormat;*/

//DAO 싱글톤 구현
public class ArticleDaoImpl implements ArticleDao{

	private ArticleDaoImpl() {}
	
	private static ArticleDaoImpl articleDAO = null;
	public static ArticleDaoImpl getInstance() {
		if(articleDAO==null) {
			articleDAO = new ArticleDaoImpl();
		}
		return articleDAO;
	}
	
	//글쓰기
	@Override
	public int insert(Connection con, Article article) throws SQLException {
		PreparedStatement pstmt = null;

	      String sql = " insert into ltb_story " + 
	            " (st_id, st_title, st_stitle, st_content, st_image, st_product) "
	            + " values ( seq_ltb_story.nextval, ?, ?, ?, ?, ?)";
	      try {
	         pstmt = con.prepareStatement(sql);
	         // ? ? ? 
	         pstmt.setString(1, article.getSt_title() );
	         pstmt.setString(2, article.getSt_stitle() );
	         pstmt.setString(3, article.getSt_content() );
	         pstmt.setString(3, article.getSt_image() );
	         pstmt.setString(3, article.getSt_product() );

	         return pstmt.executeUpdate();  // 1
	      } catch (Exception e) {
	         System.out.println("> ArticleDaoImpl.insert -" + e.toString());
	      } finally {
	         try {
	            pstmt.close();
	         }catch(Exception e) {            
	         }
	      }

		return 0;
	}

	//총 방명록 수
	@Override
	public int selectCount(Connection con) throws SQLException {
		PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      String sql = "select count(*) from ltb_story";
	      try {
	         pstmt = con.prepareStatement(sql);         
	         rs = pstmt.executeQuery();
	         rs.next();
	         return rs.getInt(1);
	      } catch (Exception e) {
	         System.out.println("> ArticleDaoImpl.selectCount -" + e.toString());
	      } finally {
	         try {
	            pstmt.close();
	            rs.close();
	         }catch(Exception e) {            
	         }
	      }      

		return 0;
	}

	//현재 페이지 방멱록 목록
	@Override
	public List<Article> selectList(Connection con, int firstRow, int endRow) throws SQLException {
		 PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      String  sql = " select *                                                     ";
	      sql+=     " from (                                                       ";
	      sql+=   "     select rownum no, t.*                                    ";
	      sql+=   "     from (                                                   ";
	      sql+=   "         select  *      ";
	      sql+=   "         from ltb_story                                     ";
	      sql+=   "         order by st_id desc                                    ";
	      sql+=   "     ) t                                                      ";
	      sql+=   " ) b                                                          ";
	      sql+=   " where b.no between ? and ?                  ";   

	      try {
	         pstmt = con.prepareStatement(sql);   
	         // where b.no between ? and ?  
	         pstmt.setInt(1, firstRow);
	         pstmt.setInt(2, endRow);

	         rs = pstmt.executeQuery();
	         if ( rs.next() ) {
	            List<Article> list = new ArrayList<Article>();
	            do {
	            	Article article = new Article();
	               article.setSt_id(rs.getInt("st_id"));
	               article.setSt_title( rs.getString("st_title"));      
	               article.setSt_stitle(rs.getString("st_stitle"));
	               //article.setSt_content(rs.getString("st_content"));
	               article.setSt_image(rs.getString("st_image"));
	               //article.setSt_product(rs.getString("st_product"));
	               list.add(article);
	            }while( rs.next() );
	            return list;
	         } // if
	      } catch (Exception e) {
	         System.out.println("> ArticleDaoImpl.selectList -" + e.toString());
	         // 예외 객체 발생....
	      } finally {
	         try {
	            pstmt.close();
	            rs.close();
	         }catch(Exception e) {            
	         }
	      }   

		return null;
	}

	//해당 번호의 글 정보 반환하는 메서드
	@Override
	public Article select(Connection con, long st_id) throws SQLException {
		PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         pstmt = con.prepareStatement(
	               "select * from ltb_story "
	                     + " where st_id = ?");
	         pstmt.setLong(1, st_id);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	            // makeMessageFromResultSet() 프로젝트 선언해서 사용.
	            return makeArticleFromResultSet(rs);
	         } else {
	            return null;
	         }
	      } finally {
	         JdbcUtil.close(rs);
	         JdbcUtil.close(pstmt);
	      }
	   }
	   // 
	   private Article makeArticleFromResultSet(ResultSet rs)
	         throws SQLException {
		  Article article = new Article();
		  article.setSt_id(rs.getInt("st_id"));
		  article.setSt_title( rs.getString("st_title"));      
		  article.setSt_stitle(rs.getString("st_stitle"));
		  article.setSt_content(rs.getString("st_content"));
		  article.setSt_image(rs.getString("st_image"));
		  article.setSt_product(rs.getString("st_product"));
	      return article;
	   }


	//해당 글 번호 -> 삭제 메서드
	@Override
	public int delete(Connection con, long st_id) throws SQLException {
		PreparedStatement pstmt = null;
	      try {
	         pstmt = con.prepareStatement(
	               "delete from ltb_story "
	                     + " where st_id = ?");
	         pstmt.setLong(1, st_id);
	         return pstmt.executeUpdate();
	      } finally {
	         JdbcUtil.close(pstmt);
	      }
	   }


	//글 수정 메서드
	@Override
	public int update(Connection con, Article article) throws SQLException {
		PreparedStatement pstmt = null;

	      String sql="update ltb_story "
	            + "set st_title=?, st_content = ?"
	            + "where st_id=?";
	      try {
	         pstmt = con.prepareStatement(sql);
	         pstmt.setLong  (1, article.getSt_id());
	         pstmt.setString(2, article.getSt_title() );
	         pstmt.setString(3, article.getSt_stitle() );
	         pstmt.setString(4, article.getSt_content() );
	         pstmt.setString(5, article.getSt_image() );
	         pstmt.setString(6, article.getSt_product() );

	         return pstmt.executeUpdate(); 
	      } finally{
	         JdbcUtil.close(pstmt);
	         JdbcUtil.close(con);
	      }
	   }
	}
