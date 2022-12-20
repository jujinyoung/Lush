<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String eventStatus = request.getParameter("eventStatus");
  String searchWord = request.getParameter("searchWord");
%>

<body>
<form action="/Lush/event/list.do" method="get">
  <div class="board-search-wrap">
    <input name="eventStatus" type="hidden" value="<%=eventStatus%>">
    <input name="currentPage" type="hidden" value="${pageBlock.currentPage}">
    <input id="where1" name="searchCondition" type="radio" value="1">
    <label for="where1">제목</label>
    <input id="where2" name="searchCondition" type="radio" value="2">
    <label for="where2">내용</label>
    <input name="searchWord" type="text" value="<%=searchWord%>">
    <button type="submit" class="black-btn">검색</button>
  </div>
</form>
</body>
</html>