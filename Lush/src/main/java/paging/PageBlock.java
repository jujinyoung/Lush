package paging;

public class PageBlock {
    //필드
    private int currentPage;
    private int numberPerPage = 10;
    private int numberOfPageBlock = 10;
    private int startOfPageBlock = 1;  // 시작 번호    1 2 [3] 4 5 6 7 8 9 10 >
    private int endOfPageBlock ;  // 끝 번호
    private boolean prev, next;    //이전,다음버튼

    public PageBlock() {}

    public PageBlock(int currentPage, int numberPerPage, int numberOfPageBlock, int startOfPageBlock, int endOfPageBlock, boolean prev, boolean next) {
        this.currentPage = currentPage;
        this.numberPerPage = numberPerPage;
        this.numberOfPageBlock = numberOfPageBlock;
        this.startOfPageBlock = startOfPageBlock;
        this.endOfPageBlock = endOfPageBlock;
        this.prev = prev;
        this.next = next;
    }

    public int getCurrentPage() {
        return currentPage;
    }

    public void setCurrentPage(int currentPage) {
        this.currentPage = currentPage;
    }

    public int getNumberPerPage() {
        return numberPerPage;
    }

    public void setNumberPerPage(int numberPerPage) {
        this.numberPerPage = numberPerPage;
    }

    public int getNumberOfPageBlock() {
        return numberOfPageBlock;
    }

    public void setNumberOfPageBlock(int numberOfPageBlock) {
        this.numberOfPageBlock = numberOfPageBlock;
    }

    public int getStartOfPageBlock() {
        return startOfPageBlock;
    }

    public void setStartOfPageBlock(int startOfPageBlock) {
        this.startOfPageBlock = startOfPageBlock;
    }

    public int getEndOfPageBlock() {
        return endOfPageBlock;
    }

    public void setEndOfPageBlock(int endOfPageBlock) {
        this.endOfPageBlock = endOfPageBlock;
    }

    public boolean isPrev() {
        return prev;
    }

    public void setPrev(boolean prev) {
        this.prev = prev;
    }

    public boolean isNext() {
        return next;
    }

    public void setNext(boolean next) {
        this.next = next;
    }
}
