package inquiry.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.util.JdbcUtil;

import inquiry.domain.Inquiry;

public class InquiryImpl implements IInquiry{

	private InquiryImpl() {}
	
	private static InquiryImpl instance = null; 
	public static IInquiry getInstance() {
		if(instance == null) {
			instance = new InquiryImpl();
		} 
		return instance;
	}

	// 문의글 목록보기
	@Override
	public List<Inquiry> selectInquiryList(Connection conn, int me_id) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select q_date, q_title, q_status, q_category, q_qid "
				+ " from ltb_qna where me_id=? order by q_date desc ";
		
		
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, me_id);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				List<Inquiry> list = new ArrayList<Inquiry>();
				do {
					Inquiry content = new Inquiry();
					content.setQ_date(rs.getDate("q_date"));
					content.setQ_category(rs.getInt("q_category"));
					content.setQ_title(rs.getString("q_title"));
					content.setQ_status(rs.getString("q_status"));
					content.setQ_qid(rs.getInt("q_qid"));
					list.add(content);
				}while(rs.next());
			
				return list;		
			}

		} catch(Exception e){
			System.out.println("selectInquiryList,,,"+ e.toString());
		
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return null;
	}	//selectInquiryList

	
	// 문의글 쓰기
	@Override
	public int insert(Connection conn, Inquiry inquirydto) throws SQLException {
		PreparedStatement pstmt = null;
		
		String sql=" insert into ltb_qna(me_id, q_qid, q_date, q_category, q_title, q_status, me_name, q_content) "
				+ " values(?, seq_ltb_qna.nextval, sysdate, ?, ?, '답변대기', ?, ?)";
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, inquirydto.getMe_id());
			pstmt.setInt(2, inquirydto.getQ_category());
			pstmt.setString(3, inquirydto.getQ_title());
			pstmt.setString(4, inquirydto.getMe_name());
			pstmt.setString(5, inquirydto.getQ_content());
			/* pstmt.setString(6, inquirydto.getQ_file()); */

			return pstmt.executeUpdate();
			
		}catch(Exception e){
			System.out.println("Inquiry insert,,," + e.toString());
		}finally {
			JdbcUtil.close(pstmt);
		}
		return 0;
	}

	// 문의글 읽기
	@Override
	public Inquiry view(Connection conn, int q_qid) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = " select q_date, q_title, q_content, q_category, q_qid ,q_answer"
				+ " from ltb_qna where q_qid=? ";
		try {

			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, q_qid);
			rs = pstmt.executeQuery();

			if(rs.next()) {
				Inquiry content = new Inquiry();
				do {

					content.setQ_date(rs.getDate("q_date"));
					content.setQ_category(rs.getInt("q_category"));
					content.setQ_title(rs.getString("q_title"));
					content.setQ_content(rs.getString("q_content"));
					content.setQ_qid(rs.getInt("q_qid"));
					content.setQ_answer(rs.getString("q_answer"));		
					
				}while(rs.next());
			
				return content;		
			}

		} catch(Exception e){
			System.out.println("viewInquiry,,,"+ e.toString());
		
		}finally {
			JdbcUtil.close(pstmt);
			JdbcUtil.close(rs);
		}
		return null;
		
	}

	

}
