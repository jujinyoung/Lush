package paging;

import java.sql.SQLException;

public class PageService {

    public static PageBlock pagingService(int currentPage, int numberPerPage, int numberOfPageBlock, int totalPages) {

        int begin = ( currentPage - 1)/numberOfPageBlock * numberOfPageBlock + 1;
        int end    = begin + numberOfPageBlock - 1;
        if( end > totalPages )  end = totalPages;

        boolean prev =   begin == 1 ?  false : true;
        boolean next  =  end == totalPages ? false: true;

        return new PageBlock(currentPage,numberPerPage,numberOfPageBlock,begin,end,prev,next);
    }
}
