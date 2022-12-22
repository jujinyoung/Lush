package inquiry.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import inquiry.domain.Inquiry;

public interface IInquiry {
   // 1. 1:1 문의글 작성
   int insert( Connection con, Inquiry message) throws SQLException;
   // 2. 총 문의글 수를 반환하는 메서드
   int selectCount(Connection con)  throws SQLException;
   // 3. 문의글 목록
   List<Inquiry> selectList( Connection con, int firstRow, int endRow ) throws SQLException;
   // 4. 문의글 보기
   List<Inquiry> select( Connection con, int  me_id) throws SQLException;
}
