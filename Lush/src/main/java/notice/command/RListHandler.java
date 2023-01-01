package notice.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import notice.domain.Recruit;
import notice.service.RecruitListService;


public class RListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		RecruitListService recruitService = RecruitListService.getInstance();
		List<Recruit> recruits =  recruitService.selectRecruitList();
		
		request.setAttribute("recruits", recruits);
		
		return "/notice/recruit.jsp";
	}

}
