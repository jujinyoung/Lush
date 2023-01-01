package inquiry.command;

import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.oreilly.servlet.multipart.FileRenamePolicy;
import com.util.ConnectionProvider;
import com.util.JdbcUtil;

import command.CommandHandler;
import inquiry.domain.Category;
import inquiry.domain.Inquiry;
import inquiry.service.InquiryWriteService;

public class WriteHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		String requestMethod = request.getMethod();
		if(requestMethod.equals("GET")) {
			Connection conn = ConnectionProvider.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<Category> clist = null;

			String sql = " select * from ltb_qcategory ";

			try{
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();

				if(rs.next()){
					clist = new ArrayList<Category>();
					do{
						Category dto = new Category(rs.getInt("qc_id"), rs.getString("qc_cname"));
						clist.add(dto);
					}while(rs.next());
				}
				JdbcUtil.close(pstmt);
				JdbcUtil.close(rs);
			}catch(Exception e){
				e.printStackTrace();
			}finally {
				JdbcUtil.close(conn);
			}
			request.setAttribute("clist", clist);

			return "/inquiry/inquiry_write.jsp?me_name=김경연";

		}else if(requestMethod.equals("POST")) {

			request.setCharacterEncoding("UTF-8"); 
			int me_id=12;
			String me_name="김경연";
/*
			String saveDirectory = request.getRealPath("C:\\lush"); // 저장 
			System.out.println("> 실제 업로드 경로 :  " + saveDirectory);

			File  saveDir = new File( saveDirectory );
			if(  !saveDir.exists() )  saveDir.mkdirs();

			int maxPostSize =  2 * 1024 * 1024  ;  // 5MB;     기본단위 byte
			String encoding = "UTF-8";    
			FileRenamePolicy policy = new DefaultFileRenamePolicy();   // (1).

			MultipartRequest mrequest = new MultipartRequest(
					request , 
					saveDirectory ,
					maxPostSize ,
					encoding , 
					policy   
					);
*/
			int pq_category = Integer.parseInt(request.getParameter("q_category")) ;
			String pq_title = request.getParameter("q_title");
			String pq_content = request.getParameter("q_content");
			/* String pq_file = request.getParameter("q_file"); */
			
			/* System.out.println(">>>>>> " + pq_category); */

			Inquiry inquirydto = new Inquiry();
			inquirydto.setMe_id(me_id);
			inquirydto.setQ_category(pq_category);
			inquirydto.setQ_title(pq_title);
			inquirydto.setMe_name(me_name);
			inquirydto.setQ_content(pq_content);

			InquiryWriteService inquiryService = InquiryWriteService.getInstance();
			int rowCount = inquiryService.writeInquiry(inquirydto);

			String location="list.do";
			if(rowCount == 1) {	location += "?write=success";	}
			else {	location += "?write=fail";	}
			response.sendRedirect(location);

		}
		return null;


	}

}
