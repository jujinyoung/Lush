package notice.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import notice.domain.Notice;
import notice.service.NoticeListService;

public class ListHandler implements CommandHandler {

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("ListHandler.process");
		NoticeListService noticeService = NoticeListService.getInstance();
		List<Notice> notices =  noticeService.selectNoticeList();

		request.setAttribute("notices", notices);
		
		return "/notice/notice.jsp";
	}

}
