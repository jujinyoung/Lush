package notice.command;

import java.sql.Connection;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.util.ConnectionProvider;

import command.CommandHandler;
import notice.dao.NoticeImpl;
import notice.domain.Notice;
import notice.service.NoticeViewService;

public class ViewHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int n_nid = Integer.parseInt(request.getParameter("n_nid"));
		
		/*
		Connection conn = ConnectionProvider.getConnection();
		NoticeImpl dao = new NoticeImpl(conn);
		*/
		
		NoticeViewService viewService = NoticeViewService.getInstance();
		Notice viewContent = viewService.viewNotice(n_nid);
		
		request.setAttribute("viewContent", viewContent);
		
		return "/notice/notice_view.jsp";
	}

	
}
