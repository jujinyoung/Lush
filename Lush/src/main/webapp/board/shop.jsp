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
	<link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>

	<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
	
	<section id="shop-list" style="padding-top: 128px;">
		<article class="top-visual">
			<div class="flex center">
				<h2 class="category-title">매장안내</h2>
					<p class="sub"></p>
			</div>
			<img src="../images/shop/shop_benner.jpg" alt="매장안내">
		</article>
		<article class="shop-wrap">
			<div class="inner">
				<form id="lushBoardSearchParam" action="/Lush/board/shop.do" method="get">
		        	<div class="board-search-wrap">
			            <input id="where1" name="searchCondition" checked="checked" type="radio" value="1">
			            <label for="where1">매장명</label>
			            <input id="where2" name="searchCondition" type="radio" value="2">
			            <label for="where2">주소</label>
			            <input name="searchWord" type="text" placeholder="검색 단어를 입력해 주세요." value="<%=searchWord%>">
			            <input id="spId" name="spId" type="hidden" value="1">
			            <button type="submit" class="black-btn">검색</button>
		        	</div>
	    		</form>
	    		<div class="article-list">
	    			<div class="inner">
	   					<c:choose>
	   						<c:when test="${ not empty shops }">
	    						<ul class="list-thumb">
	    							<c:forEach items="${ shops }" var="dto">
	    								<li>
	                                    	<a href="javascript:goView('${ dto.sp_id }');" class="article-thumb">
	                                        	<img src="../images/shop/shop_${ dto.sp_id }.jpg" alt="${ dto.sp_name }">
	                                    	</a>
	                                    	<a href="javascript:goView('${ dto.sp_id }');" class="article-title">${ dto.sp_name }</a>
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
	       			</div>
       				<jsp:include page="/WEB-INF/inc/shop/paging.jsp">
       					<jsp:param name="searchCondition" value="<%=searchCondition %>"/>
       					<jsp:param name="searchWord" value="<%=searchWord %>"/>
       				</jsp:include>
				</div>
			</div>
		</article>
	</section>
	
	<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>
	
	<script>
	    if (<%=searchCondition%> == 1){
	        $('input[id="where1"]').prop('checked',true);
	    }else{
	        $('input[id="where2"]').prop('checked',true);
	    }
	</script>
	<script>
		function goView(spId) {
			$('#lushBoardSearchParam').prop("action", "/Lush/board/shop/view.do");
			$('#spId').val(spId);
			$('#lushBoardSearchParam').submit();
		}
	</script>
</body>
</html>