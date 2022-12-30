package inquiry.dao;

import inquiry.domain.Inquiry;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;



public interface IInquiry {
	// 1:1문의글 목록보기
	public List<Inquiry> selectInquiryList(Connection conn, int me_id) throws SQLException;
	
	// 1:1문의글 쓰기
	int insert(Connection conn, Inquiry inquirydto) throws SQLException;
	
	// 1:1문의글 정보 반환
	Inquiry view(Connection conn, int q_qid) throws SQLException;
	

}
