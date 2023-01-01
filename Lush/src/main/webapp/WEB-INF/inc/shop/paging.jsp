<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  String searchCondition = request.getParameter("searchCondition");
  String searchWord = request.getParameter("searchWord");
%>

<body>
<div class="paginate">
  <ul>
    <c:if test="${pageBlock.prev}">
		<li class="first">
			<a href="/Lush/board/shop.do?currentPage=${pageBlock.startOfPageBlock}&searchCondition=<%=searchCondition%>&searchWord=<%=searchWord%>"> 
				<img src="../images/ico/page_first.svg" alt="첫 페이지로">
			</a>
		</li>
		<li class="prev">
			<a href="/Lush/board/shop.do?currentPage=${pageBlock.currentPage-1}&searchCondition=<%=searchCondition%>&searchWord=<%=searchWord%>">
				<img src="../images/ico/page_prev.svg" alt="앞 페이지로">
			</a>
		</li>
	</c:if>
    <c:forEach begin="${pageBlock.startOfPageBlock}" end="${pageBlock.endOfPageBlock}" var="i" step="1">
		<c:choose>
			<c:when test="${pageBlock.currentPage eq i}">
				<li>
					<a href="#" class="num on">${i}</a>
				</li>
			</c:when>
			<c:otherwise>
				<li>
					<a href="/Lush/board/shop.do?currentPage=${i}&searchCondition=<%=searchCondition%>&searchWord=<%=searchWord%>">${i}</a>
				</li>
			</c:otherwise>
		</c:choose>
	</c:forEach>
    <c:if test="${pageBlock.next}">
		<li class="next">
			<a href="/Lush/board/shop.do?currentPage=${pageBlock.currentPage+1}&searchCondition=<%=searchCondition%>&searchWord=<%=searchWord%>>">
				<img src="../images/ico/page_next.svg" alt="다음 페이지로">
			</a>
		</li>
		<li class="last">
			<a href="/Lush/board/shop.do?currentPage=${pageBlock.endOfPageBlock}&searchCondition=<%=searchCondition%>&searchWord=<%=searchWord%>>">
				<img src="../images/ico/page_last.svg" alt="마지막 페이지로">
			</a>
		</li>
    </c:if>
  </ul>
</div>
</body>
</html>