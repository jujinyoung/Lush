package inquiry.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import inquiry.domain.Inquiry;
import inquiry.service.InquiryViewService;

public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int q_qid = Integer.parseInt(request.getParameter("q_qid"));
		
		InquiryViewService viewService = InquiryViewService.getInstance();
		Inquiry viewContent = viewService.view(q_qid);
		
		request.setAttribute("viewContent", viewContent);
		
		return "/inquiry/inquiry_read.jsp";
		
		
	}

}
