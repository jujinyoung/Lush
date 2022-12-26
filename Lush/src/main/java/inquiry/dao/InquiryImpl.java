package inquiry.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import inquiry.domain.Inquiry;

public class InquiryImpl implements IInquiry{

	private InquiryImpl() {}
	
	private static InquiryImpl inquiryDAO = null;	
	public static InquiryImpl getInstance() {
			if(inquiryDAO == null) {
				inquiryDAO = new InquiryImpl();
			}
			return inquiryDAO;
		}

	// 문의글 작성
	@Override
	public int insert(Connection con, Inquiry message) throws SQLException {
		PreparedStatement pstmt = null;
		String sql = "insert into ltb_qna(q_qid, q_date, q_category, q_title, q_status"
				+ ", me_name, q_content, q_attach, q_answer, me_id)" 
		+ "values(seq_ltb_qna.nextval, to_char(sysdate, 'yyyy-mm-dd'), ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
	         pstmt = con.prepareStatement(sql);
	         // ? ? ? 
	         
	         pstmt.setString(1, message.getQ_category() );
	         pstmt.setString(2, message.getQ_title() );
	         pstmt.setString(3, message.getQ_status() );
	         pstmt.setString(4, message.getMe_name() );
	         pstmt.setString(5, message.getQ_content() );
	         pstmt.setString(6, message.getQ_attach() );
	         pstmt.setString(7, message.getQ_answer() );
	         pstmt.setInt(8, message.getMe_id() );
	         

	         return pstmt.executeUpdate(); 
	      } catch (Exception e) {
	         System.out.println("> Inquiry 게시글 insert -" + e.toString());
	      } finally {
	         try {
	            pstmt.close();
	         }catch(Exception e) {            
	         }
	      }
		
		return 0;
	}
	
	// 총 문의글 수
	@Override
	public int selectCount(Connection con) throws SQLException {
	      PreparedStatement pstmt = null;
	      ResultSet rs = null;

	      String sql = "select count(*) from ltb_qna";
	      try {
	          pstmt = con.prepareStatement(sql);         
	          rs = pstmt.executeQuery();
	          rs.next();
	          return rs.getInt(1);
	       } catch (Exception e) {
	          System.out.println("> 1:1문의 게시글.selectCount -" + e.toString());
	       } finally {
	          try {
	             pstmt.close();
	             rs.close();
	          }catch(Exception e) {            
	          }
	       }   
	      
		return 0;
	}
	
	// 현재 페이지의 문의글 목록
	@Override
	public List<Inquiry> selectList(Connection con, int firstRow, int endRow) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String sql = "select * from ("
				+ "			select rownum no, t.*"
				+ "			from (select * from ltb_qna order by q_qid) t ) b"
				+ "where b.no between ? and ?)";
	      
		try {
	         pstmt = con.prepareStatement(sql);   

	         pstmt.setInt(1, firstRow);
	         pstmt.setInt(2, endRow);

	         rs = pstmt.executeQuery();
	         if ( rs.next() ) {
	            List<Inquiry> list = new ArrayList<Inquiry>();
	            do {
	            	Inquiry message = new Inquiry();
	               message.setQ_date(rs.getString("q_date"));
	               message.setQ_category( rs.getString("q_category"));      
	               message.setQ_title(rs.getString("q_title"));
	               message.setQ_status(rs.getString("q_status"));
	               list.add(message);
	            }while( rs.next() );
	            return list;
	         } // if
	      } catch (Exception e) {
	         System.out.println("> 문의글.selectList -" + e.toString());
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
	// 클릭한 문의글 번호의 글 정보 반환

	@Override
	public List<Inquiry> select(Connection con, int me_id) throws SQLException {
		PreparedStatement pstmt = null;
	      ResultSet rs = null;
	      try {
	         pstmt = con.prepareStatement(
	               "select * from ltb_qna "
	                     + " where me_id = ?");
	         pstmt.setInt(1, me_id);
	         rs = pstmt.executeQuery();
	         if (rs.next()) {
	        	 List<Inquiry> list = new ArrayList<Inquiry>();
	        	 do {
	        		 Inquiry message = new Inquiry();
	        		
		               message.setQ_category( rs.getString("q_category"));      
		               message.setQ_title(rs.getString("q_title"));
		               message.setQ_date(rs.getString("q_date"));
		               message.setQ_content(rs.getString("q_content"));
		               message.setQ_answer(rs.getString("q_answer"));
	                 list.add(message);
	              }while( rs.next() );
	        	 return list;
	         } else {
	            return null;
	         }
	      } finally {
	         JdbcUtil.close(rs);
	         JdbcUtil.close(pstmt);
	      }
	}


}
