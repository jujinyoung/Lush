package managernotice.command;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import command.CommandHandler;
import managernotice.domain.ManNotice;
import managernotice.service.WriteMessageService;

public class WriteHandler implements CommandHandler{

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		  String n_title = request.getParameter("n_title");
	      String n_writer = request.getParameter("n_writer");
	      Date n_date = request.getParameter("n_date");
	      String n_content = request.getParameter("n_content");
	      
	      ManNotice notice = new ManNotice();
	      notice.setN_title(n_title);
	      notice.setN_writer(n_writer);
	      notice.setN_date(n_date);
	      notice.setN_content(n_content);
	      
	      WriteMessageService messageService = WriteMessageService.getInstance();
	      int rowCount = messageService.write(notice);
	      
	      // 포워딩 / 리다이렉트 X
	      String location = "list.do";
	      response.sendRedirect(location);
	            
	      return null;
	   }

	}