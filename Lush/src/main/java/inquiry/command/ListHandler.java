package inquiry.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import inquiry.service.InquiryListService;
import inquiry.service.InquiryListView;

public class ListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("> /inquiry/inquiry.do : ListHandler.process() 호출됨...");
		
		int me_id=12;
		String me_name="김경연";
		
		String  pCurrentPage = request.getParameter("page");  // 현재페이지 번호  page 파라미터명
	      int currentPage = 1;
	      if( pCurrentPage != null ) {
	         currentPage = Integer.parseInt( pCurrentPage );
	      }
	    

	      InquiryListService inquiryListService = InquiryListService.getInstance(); 
	      
	      InquiryListView viewData  = inquiryListService.getInquiryList(currentPage);

	      request.setAttribute("viewData", viewData);
		
		return "/inquiry/inquiry.jsp";
	}

}
