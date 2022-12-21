package article.command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import article.service.ArticleListService;
import article.service.ArticleListView;
//import article.service.ArticleListView;
import command.CommandHandler;

public class ListHandler implements CommandHandler{
	
		   @Override
		   public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		      System.out.println("> /Lush/article/list.do?page=3 : ListHandler.process() 호출됨...");

		      String  pCurrentPage = request.getParameter("page");  // 현재페이지 번호  page 파라미터명
		      int currentPage = 1;
		      if( pCurrentPage != null ) {
		         currentPage = Integer.parseInt( pCurrentPage );
		      }

		      ArticleListService articleListService = ArticleListService.getInstance();
		      //  
		      ArticleListView viewData  = articleListService.getArticleList(currentPage);

		      request.setAttribute("viewData", viewData);  

		      return "/article/list.jsp";  // 포워딩
		   }
	

}
