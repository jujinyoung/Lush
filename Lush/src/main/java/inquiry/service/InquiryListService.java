package inquiry.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

import javax.naming.NamingException;

import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import inquiry.dao.InquiryImpl;
import inquiry.domain.Inquiry;

public class InquiryListService {
	private static InquiryListService  instance = null;
	   
	   private InquiryListService() {}
	   
	   public static InquiryListService getInstance() {
	      if(   instance == null ) {
	         instance = new InquiryListService();
	      }
	      return instance;
	   }

	   // 한 페이지에 출력할 게시글 수 
	   private static final int INQUIRY_COUNT_PER_PAGE = 5;
	   
	   // InquiryListView [방명록 목록 + 페이징 처리] 반환하는 메서드
	   public  InquiryListView getInquiryList( int pageNumber ) throws ServiceException {
	      
	      Connection conn = null;      
	      int currentPageNumber = pageNumber;

	      try {          
	         conn = ConnectionProvider.getConnection();          
	         // DAO 가져오기
	         InquiryImpl inquiryDao = InquiryImpl.getInstance();

	         // 총 게시글 수.	총 레코드 수 저장
	         int inquiryTotalCount = inquiryDao.selectCount(conn);

	         List<Inquiry> inquiryList = null;

	         int firstRow = 0;
	         int endRow = 0;

	         if ( inquiryTotalCount > 0 ) {
	            firstRow =   (pageNumber - 1) * INQUIRY_COUNT_PER_PAGE + 1;
	            endRow   = firstRow + INQUIRY_COUNT_PER_PAGE - 1;
	            inquiryList = inquiryDao.selectList(conn, firstRow, endRow);
	         } else {
	            currentPageNumber = 0;
	            inquiryList = Collections.emptyList();  // 
	         }


	         return new InquiryListView(
	        		 inquiryList,
	        		 inquiryTotalCount
	               , currentPageNumber
	               , INQUIRY_COUNT_PER_PAGE
	               , firstRow, endRow);

	      } catch (SQLException | NamingException e) {
	         throw new ServiceException("> 목록 구하기 실패: " + e.getMessage(), e);
	      } finally {
	         try {
	            conn.close();  // 커넥션 풀 반환
	         } catch (SQLException e) {
	            e.printStackTrace();
	         }  
	      }
	      
	   } 

	   public List<Inquiry> getQ_content(int me_id) throws ServiceException {
	      Connection conn = null; 
	      try {
	         conn = ConnectionProvider.getConnection();
	         InquiryImpl listDAO = InquiryImpl.getInstance();      
	         
	         return  listDAO.select(conn, me_id);
	         
	      } catch (Exception e) {
	         throw new ServiceException("메세지 구하기 실패 : " 
	               + e.getMessage(), e);
	      }finally {
	         JdbcUtil.close(conn);
	      }
	   }
	  
}
