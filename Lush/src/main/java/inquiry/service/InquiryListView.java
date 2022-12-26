package inquiry.service;

import java.util.List;

import inquiry.domain.Inquiry;

public class InquiryListView {
	// 목록 list + 페이징처리 pageBlock 합쳐서 하나의 객체로..

	   // list
	   private List<Inquiry> inquiryList; 

	   // PageBlock
	   private int inquiryTotalCount;   // 총 글 수   
	   private int pageTotalCount;      // 총페이지 수
	   private int currentPageNumber;   // 현재 페이지 번호
	   private int inquiryCountPerPage; // 한 페이지에 출력할 방명록 글 수
	   private int firstRow;            // 시작
	   private int endRow;              // 끝

	   
		public InquiryListView(List<Inquiry> inquiryList, int inquiryTotalCount, int currentPageNumber,
			int inquiryCountPerPage, int firstRow, int endRow) {
		
		this.inquiryList = inquiryList;
		this.inquiryTotalCount = inquiryTotalCount;
		this.currentPageNumber = currentPageNumber;
		this.inquiryCountPerPage = inquiryCountPerPage;
		this.firstRow = firstRow;
		this.endRow = endRow;
		
		// 총 페이지수를 계산하는 메소드 
		calculatePageTotalCount();
	}


	   // 총페이지수를 계산해서 반환하는 메서드 
	   private void calculatePageTotalCount() {
	      if (inquiryTotalCount == 0) {
	         pageTotalCount = 0;
	      } else {

	         pageTotalCount =
	               (int)( Math.ceil((double)inquiryTotalCount / inquiryCountPerPage ));
	      }
	   }



	   public List<Inquiry> getInquiryList() {
		return inquiryList;
	}


	public void setInquiryList(List<Inquiry> inquiryList) {
		this.inquiryList = inquiryList;
	}


	public int getInquiryTotalCount() {
		return inquiryTotalCount;
	}


	public void setInquiryTotalCount(int inquiryTotalCount) {
		this.inquiryTotalCount = inquiryTotalCount;
	}


	public int getPageTotalCount() {
		return pageTotalCount;
	}


	public void setPageTotalCount(int pageTotalCount) {
		this.pageTotalCount = pageTotalCount;
	}


	public int getCurrentPageNumber() {
		return currentPageNumber;
	}


	public void setCurrentPageNumber(int currentPageNumber) {
		this.currentPageNumber = currentPageNumber;
	}


	public int getInquiryCountPerPage() {
		return inquiryCountPerPage;
	}


	public void setInquiryCountPerPage(int inquiryCountPerPage) {
		this.inquiryCountPerPage = inquiryCountPerPage;
	}


	public int getFirstRow() {
		return firstRow;
	}


	public void setFirstRow(int firstRow) {
		this.firstRow = firstRow;
	}


	public int getEndRow() {
		return endRow;
	}


	public void setEndRow(int endRow) {
		this.endRow = endRow;
	}


	public boolean isEmpty() {
	      return this.inquiryTotalCount == 0 ;
	   }
}
