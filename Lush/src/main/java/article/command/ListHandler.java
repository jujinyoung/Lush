package article.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.domain.Article;
import article.service.ArticleListService;
//import article.service.ArticleListView;
//import article.service.ArticleListView;
import command.CommandHandler;
//import event.domain.Event;
//import event.service.EventListService;

public class ListHandler implements CommandHandler{
	
	
	@Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println(1);
		//        System.out.println("ListHandler.process");
        ArticleListService listService = ArticleListService.getInstance();
        System.out.println(2);
        List<Article> articles = listService.selectArticleList();
        System.out.println(3);
        request.setAttribute("articles", articles);
        System.out.println(4);
        return "/article/list.jsp";
    }
	
	/*
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
	*/

}
