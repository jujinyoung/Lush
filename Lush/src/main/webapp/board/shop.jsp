<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int searchCondition = request.getParameter("searchCondition")==null ? 1 :Integer.parseInt(request.getParameter("searchCondition"));
    String searchWord = request.getParameter("searchWord")==null ? "" : request.getParameter("searchWord");
    int proceedRecords = (int) request.getAttribute("proceedRecords");
    int endRecords = (int) request.getAttribute("endRecords");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>러쉬 매장안내</title>
	<link rel="stylesheet" href="css/shop_style.css" type="text/css">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
	<section id="shop-list" style="padding-top: 128px;">
		<article class="top-visual">
			<div class="flex center">
				<h2 class="category-title">SHOP INFORMATION</h2>
					<p class="sub"></p>
			</div>
			<img src="https://www.lush.co.kr/upload/shop/20220215110847L.jpg" alt="매장안내">
		</article>
		<article>
			<form action="/Lush/board/shop.do" method="get">
	        	<div class="board-search-wrap">
		            <input id="shop_name" name="shopname" checked="checked" type="radio" value="CONT_SUBJECT">
		            <label for="shop_name">매장명</label>
		            <input id="shop_adr" name="shopadr" type="radio" value="CONTENT_PC">
		            <label for="shop_adr">주소</label>
		            <input name="search" type="text" placeholder="검색 단어를 입력해 주세요.">
		            <button type="submit" class="black-btn">검색</button>
	        	</div>
	        	<div><input type="hidden" name="_csrf" value=""></div>
    		</form>
    		<div class="article-list">
    			<div class="inner">
   					<c:choose>
   						<c:when test="${ not empty shops }">
    						<ul class="list-thumb">
    							<c:forEach items="${ shops }" var="dto">
    								<li>
                                    	<a class="article-thumb">
                                        	<img src="../images/sp_${ dto.sp_id }" alt="${ dto.sp_name }">
                                    	</a>
                                    	<a class="article-title">${ dto.sp_name }</a>
                                	</li>
              					</c:forEach>
    						</ul>
       					</c:when>
        				<c:otherwise>
             				<div class="empty big">
								<p>확인되는 게시글이 없습니다.</p>
							</div>
          				</c:otherwise>
       				</c:choose>
				<div class="paginate">
					<c:choose>
   						<c:when test="${ not empty list }">
   							<ul>
				             	<c:if test="${ pageBlock.prev }">
				             		<li class="first"><a href="/board/shop?page=1"><img src="https://www.lush.co.kr/content/renewal/pc/images/ico/page_first.svg" alt="처음 페이지로"></a></li>
				             		<li class="prev"><a href="/board/shop?page=${  pageBlock.startOfPageBlock - 1  }"><img src="https://www.lush.co.kr/content/renewal/pc/images/ico/page_prev.svg" alt="앞 페이지로"></a></li>
				             	</c:if>
   								<c:forEach begin="${  pageBlock.startOfPageBlock  }" end="${  pageBlock.endOfPageBlock  }" var="i" step="1">
					             	<c:choose> 
					             		<c:when test="${ pageBlock.page eq i }">
					             			<li><a href="#" class="num on">1</a></li>
					             		</c:when>
					             		<c:otherwise>
					             			<a href="board/shop?page=${ i }">${ i }</a> 
					             		</c:otherwise>
					             	</c:choose>
             					</c:forEach>
				             	<c:if test="${ pageBlock.next }">
				             		<li class="next"><a href="/board/shop?page=${  pageBlock.startOfPageBlock + 1  }"><img src="https://www.lush.co.kr/content/renewal/pc/images/ico/page_next.svg" alt="다음 페이지로"></a></li>
									<li class="last"><a href="/board/shop?page=${  pageBlock.lastPage  }"><img src="https://www.lush.co.kr/content/renewal/pc/images/ico/page_last.svg" alt="마지막 페이지로"></a></li>
				               </c:if>
							</ul>
       					</c:when>
	        			<c:otherwise>
	          			</c:otherwise>
       				</c:choose>
					</div>
				</div>
			</div>
		</article>
	</section>
	
</body>
</html>