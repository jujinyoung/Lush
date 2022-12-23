package article.command;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import article.domain.Article;
import article.paging.PageBlock;
import article.paging.PageService;
import article.service.ArticleListService;
//import article.service.ArticleListView;
//import article.service.ArticleListView;
import command.CommandHandler;
//import event.domain.Event;
//import event.service.EventListService;

public class ListHandler implements CommandHandler{
	
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
    
      int categoryLink = request.getParameter("categoryLink")==null ? 1 : Integer.parseInt(request.getParameter("categoryLink"));	
      //검색 처리
      int searchCondition = request.getParameter("searchCondition")==null ? 1 : Integer.parseInt(request.getParameter("searchCondition"));
      String searchWord = request.getParameter("searchWord") == null ? "" : request.getParameter("searchWord");
      int currentPage = request.getParameter("currentPage")==null ? 1 : Integer.parseInt(request.getParameter("currentPage"));

      //이벤트정보 조회 후 list.jsp페이지에 뿌리기
      ArticleListService listService = ArticleListService.getInstance();
      List<Article> articles = null;
      PageBlock pageBlock = null;
      int numberPerPage = 12;
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
	
	
	/*
	@Override
    public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		
		//System.out.println(1);
		//        System.out.println("ListHandler.process");
        ArticleListService listService = ArticleListService.getInstance();
        //System.out.println(2);
        List<Article> articles = listService.selectArticleList();
        //System.out.println(3);
        request.setAttribute("articles", articles);
        //System.out.println(4);
        return "/article/list.jsp";
    }
}
*/	

		


