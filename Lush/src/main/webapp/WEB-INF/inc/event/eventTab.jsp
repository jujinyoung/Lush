<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  String proceedRecords = request.getParameter("proceedRecords");
  String endRecords = request.getParameter("endRecords");
%>
<body>
<ul class="tab-btn type3">
  <li><a href="/Lush/event/list.do?eventStatus=1">진행중인 이벤트 (<%=proceedRecords%>)</a></li>
  <li><a href="/Lush/event/eventresult.do">선정자 발표</a></li>
  <li><a href="/Lush/event/list.do?eventStatus=2">종료된 이벤트 (<%=endRecords%>)</a></li>
</ul>
</body>
</html>