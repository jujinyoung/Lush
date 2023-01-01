package inquiry.command;


import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import inquiry.domain.Inquiry;
import inquiry.service.InquiryListService;
import member.domain.User;

public class ListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {

		User user = (User) request.getSession(false).getAttribute("authUser");
		int me_id = user.getId();

		InquiryListService listService = InquiryListService.getInstance();
		List<Inquiry> inquirys = listService.selectEventList(me_id);
		
		request.setAttribute("inquirys", inquirys);
		
		
		
		
		return "/inquiry/inquiry.jsp";
	}

}
