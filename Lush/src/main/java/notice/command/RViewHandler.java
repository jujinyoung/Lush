package notice.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import notice.domain.Recruit;
import notice.service.RecruitViewService;



public class RViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int rec_id = Integer.parseInt(request.getParameter("rec_id"));
		
		RecruitViewService viewService = RecruitViewService.getInstance();
		Recruit viewContent = viewService.viewRecruit(rec_id);
		
		request.setAttribute("viewContent", viewContent);
		
		return "/notice/recruit_view.jsp";
	}

	
}
