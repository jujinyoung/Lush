package article.service;

import java.util.List;

import article.domain.Article;

public class ArticleListView {

	// 목록 list + 페이징처리 pageBlock

	   // list
	   private List<Article> articleList; // 방명록 목록을 저장할 ArrayList<> list

	   // PageBlock
	   private int articleTotalCount;   // 총 방명록 글 수   
	   private int pageTotalCount;      // 총페이지 수
	   private int currentPageNumber;   // 현재 페이지 번호
	   private int articleCountPerPage; // 한 페이지에 출력할 방명록 글 수
	   private int firstRow;            // 시작
	   private int endRow;              // 끝

	   // 생성자
	   public ArticleListView(
	         List<Article> articleList,
	         int articleTotalCount, 
	         int currentPageNumber,
	         int articleCountPerPage, 
	         int startRow, int endRow) {

	      this.articleList = articleList;
	      this.articleTotalCount = articleTotalCount;
	      this.currentPageNumber = currentPageNumber;
	      this.articleCountPerPage = articleCountPerPage;
	      this.firstRow = startRow;
	      this.endRow = endRow;

	      // 총 페이지수를 계산하는 메소드
	      calculatePageTotalCount();
	   }

	   // 총페이지수를 계산해서 반환하는 메서드 
	   private void calculatePageTotalCount() {
	      if (articleTotalCount == 0) {
	         pageTotalCount = 0;
	      } else {
	         pageTotalCount =
	               (int)( Math.ceil((double)articleTotalCount / articleCountPerPage ));
	      }
	   }


	   public List<Article> getArticleList() {
	      return articleList;
	   }

	   public int getArticleTotalCount() {
	      return articleTotalCount;
	   }

	   public int getPageTotalCount() {
	      return pageTotalCount;
	   }

	   public int getCurrentPageNumber() {
	      return currentPageNumber;
	   }

	   public int getArticleCountPerPage() {
	      return articleCountPerPage;
	   }

	   public int getFirstRow() {
	      return firstRow;
	   }

	   public int getEndRow() {
	      return endRow;
	   }

	   // 추가 
	   public boolean isEmpty() {
	      return this.articleTotalCount == 0 ;
	   }

	
}
