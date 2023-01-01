package managernotice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import managernotice.domain.ManNotice;

public class ManNoticeImpl implements ManNoticeDAO{

	private static ManNoticeImpl instance = new ManNoticeImpl();
    private ManNoticeImpl(){}
    public static ManNoticeImpl getInstance(){
    	return  instance;
    	}
	
	@Override
	public int insert(Connection con, ManNotice notice) throws SQLException {
		PreparedStatement pstmt = null;

	      String sql = " insert into ltb_notice " + 
	            " (n_nid, n_title, n_writer, n_date, n_content, n_num) "
	            + " values ( seq_ltb_notice.nextval, ?, ?, sysdate, ?, null)";
	      try {
	         pstmt = con.prepareStatement(sql);
	         // ? ? ? 
	         pstmt.setString(1, notice.getN_title() );
	         pstmt.setString(2, notice.getN_writer() );
	         pstmt.setString(3, notice.getN_content() );

	         return pstmt.executeUpdate();  // 1
	      } catch (Exception e) {
	         System.out.println("> MessageImpl.insert -" + e.toString());
	      } finally {
	         try {
	            pstmt.close();
	         }catch(Exception e) {            
	         }
	      }
	      return 0; // 
	   }

}
