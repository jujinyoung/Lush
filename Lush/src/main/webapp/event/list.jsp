<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int eventStatus = request.getParameter("eventStatus")==null ? 1 :Integer.parseInt(request.getParameter("eventStatus"));
    int searchCondition = request.getParameter("searchCondition")==null ? 1 :Integer.parseInt(request.getParameter("searchCondition"));
    String searchWord = request.getParameter("searchWord")==null ? "" : request.getParameter("searchWord");
    int proceedRecords = (int) request.getAttribute("proceedRecords");
    int endRecords =  (int) request.getAttribute("endRecords");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>러쉬 EVENT</title>
    <link rel="stylesheet" href="css/list_style.css" type="text/css">
    <link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>

<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>

<div class="inner" style="padding-top: 128px;">
    <div class="page-top">
        <h2 class="page-title">이벤트</h2>
    </div>
    <jsp:include page="/WEB-INF/inc/event/boardEvent.jsp">
        <jsp:param name="eventStatus" value="<%=eventStatus%>"/>
        <jsp:param name="searchWord" value="<%=searchWord%>"/>
        <jsp:param name="currentPage" value="${pageBlock.currentPage}"/>
        <jsp:param name="searchCondition" value="<%=searchCondition%>"/>
    </jsp:include>

    <jsp:include page="/WEB-INF/inc/event/eventTab.jsp">
        <jsp:param name="proceedRecords" value="<%=proceedRecords%>"/>
        <jsp:param name="endRecords" value="<%=endRecords%>"/>
        <jsp:param name="eventStatus" value="<%=eventStatus%>"/>
    </jsp:include>

    <div class="tab-cont">
        <div class="tab-inner-on">
            <div class="inner">
                <ul class="list-thumb">
                    <!-- db에서 이벤트정보가져다가 쓰기 -->
                    <c:forEach var="event" items="${events}">
                        <li>
                            <a href="/Lush/event/view.do?eventID=${event.event.id}&eventStatus=<%=eventStatus%>&currentPage=${pageBlock.currentPage}&proceedRecords=<%=proceedRecords%>&endRecords=<%=endRecords%>" class="article-thumb">
                                <img src="${event.event.image}" alt="${event.event.title}">
                                <div class="mask"></div>
                            </a>
                            <a href="/Lush/event/view.do?eventID=${event.event.id}&eventStatus=<%=eventStatus%>&currentPage=${pageBlock.currentPage}&proceedRecords=<%=proceedRecords%>&endRecords=<%=endRecords%>" class="article-title">
                                    ${event.event.title} (${event.review})
                            </a>
                            <a href="/Lush/event/view.do?eventID=${event.event.id}&eventStatus=<%=eventStatus%>&currentPage=${pageBlock.currentPage}&proceedRecords=<%=proceedRecords%>&endRecords=<%=endRecords%>" class="article-cate">
                                ${event.event.subtitle}
                            </a>
                            <p class="date">${event.event.rdate}~${event.event.edate}</p>
                        </li>
                    </c:forEach>
                </ul>
                <jsp:include page="/WEB-INF/inc/event/paging.jsp">
                    <jsp:param name="eventStatus" value="<%=eventStatus%>"/>
                    <jsp:param name="searchCondition" value="<%=searchCondition%>"/>
                    <jsp:param name="searchWord" value="<%=searchWord%>"/>
                    <jsp:param name="url" value="/Lush/event/list.do?"/>
                </jsp:include>
            </div>
        </div>
    </div>

    <jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>
<script>
    if(<%=eventStatus%> == 2){
        $('.list-thumb li').addClass('end');
    }else{
    }
</script>
</div>
</body>
</html>