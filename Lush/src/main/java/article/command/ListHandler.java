package article.command;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.domain.Article;
import article.service.ArticleListService;
//import article.service.ArticleListView;
//import article.service.ArticleListView;
import command.CommandHandler;
import paging.PageBlock;
import paging.PageService;
//import event.domain.Event;
//import event.service.EventListService;

public class ListHandler implements CommandHandler{
	
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
      //카테고리	
      int categoryLink = request.getParameter("categoryLink")==null ? 1 : Integer.parseInt(request.getParameter("categoryLink"));	
      //검색
      int searchCondition = request.getParameter("searchCondition")==null ? 1 : Integer.parseInt(request.getParameter("searchCondition"));
      String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");
      int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));

      ArticleListService listService = ArticleListService.getInstance();
      List<Article> articles = null;
      paging.PageBlock pageBlock = null;
      int numberPerPage = 6;
      int numberOfPageBlock = 10;

      System.out.println("searchWord = " + searchWord);
      if (searchWord.equals("")){
    	  articles = listService.selectArticleList(categoryLink, currentPage, numberPerPage);
      }else {
    	  articles = listService.searchArticleList(categoryLink, currentPage, numberPerPage, searchCondition, searchWord);
      }

      int totalPages = listService.getTotalPages(numberPerPage, categoryLink);

      pageBlock = PageService.pagingService(currentPage, numberPerPage, numberOfPageBlock, totalPages);

      request.setAttribute("categoryLink", categoryLink);
      request.setAttribute("searchCondition", searchCondition);
      request.setAttribute("searchWord", searchWord);
      request.setAttribute("articles", articles);
      request.setAttribute("pageBlock", pageBlock);

      return "/article/list.jsp";
  }
}

		


