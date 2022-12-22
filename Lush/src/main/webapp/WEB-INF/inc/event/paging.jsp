<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
  String eventStatus = request.getParameter("eventStatus");
  String searchCondition = request.getParameter("searchCondition");
  String searchWord = request.getParameter("searchWord");
%>

<body>
<div class="paginate">
  <ul>
    <c:if test="${pageBlock.prev}">
      <li class="first"><a href="/Lush/event/list.do?eventStatus=<%=eventStatus%>&currentPage=${pageBlock.startOfPageBlock-1}&searchCondition=<%=searchCondition%>&searchWord=<%=searchWord%>"> &laquo; </a></li></c:if>
    <c:forEach begin="${pageBlock.startOfPageBlock}" end="${pageBlock.endOfPageBlock}" var="i" step="1">
      <c:choose>
        <c:when test="${pageBlock.currentPage eq i}">
          <li><a href="#" class="num on">${i}</a></li>
        </c:when>
        <c:otherwise>
          <li><a href="/Lush/event/list.do?eventStatus=<%=eventStatus%>&currentPage=${i}&searchCondition=<%=searchCondition%>&searchWord=<%=searchWord%>">${i}</a></li>
        </c:otherwise>
      </c:choose>
    </c:forEach>
    <c:if test="${pageBlock.next}">
      <li class="last"><a href="Lush/event/list.do?eventStatus=<%=eventStatus%>&currentPage=${pageBlock.endOfPageBlock+1}&searchCondition=<%=searchCondition%>&searchWord=<%=searchWord%>>"> &raquo; </a></li>
    </c:if>
  </ul>
</div>
</body>
</html>