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
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<header></header>
<div class="inner">
    <div class="page-top">
        <h2 class="page-title">이벤트</h2>
    </div>
    <jsp:include page="/WEB-INF/inc/event/boardEvent.jsp">
        <jsp:param name="eventStatus" value="<%=eventStatus%>"/>
        <jsp:param name="searchWord" value="<%=searchWord%>"/>
    </jsp:include>

    <jsp:include page="/WEB-INF/inc/event/eventTab.jsp">
        <jsp:param name="proceedRecords" value="<%=proceedRecords%>"/>
        <jsp:param name="endRecords" value="<%=endRecords%>"/>
    </jsp:include>

    <div class="tab-cont">
        <div class="tab-inner-on">
            <div class="inner">
                <ul class="list-thumb">
                    <!-- db에서 이벤트정보가져다가 쓰기 -->
                    <c:forEach var="event" items="${events}">
                        <li>
                            <a href="/Lush/event/view.do?eventID=${event.id}&eventStatus=<%=eventStatus%>&currentPage=${pageBlock.currentPage}" class="article-thumb">
                                <img src="${event.image}" alt="${event.title}">
                                <div class="mask"></div>
                            </a>
                            <a href="/Lush/event/view.do?eventID=${event.id}&eventStatus=<%=eventStatus%>&currentPage=${pageBlock.currentPage}" class="article-title">
                                ${event.title} ?
                            </a>
                            <a href="/Lush/event/view.do?eventID=${event.id}&eventStatus=<%=eventStatus%>&currentPage=${pageBlock.currentPage}" class="article-cate">
                                ${event.subtitle}
                            </a>
                            <p class="date">${event.rdate}~${event.edate}</p>
                        </li>
                    </c:forEach>
                </ul>
                <jsp:include page="/WEB-INF/inc/event/paging.jsp">
                    <jsp:param name="eventStatus" value="<%=eventStatus%>"/>
                    <jsp:param name="searchCondition" value="<%=searchCondition%>"/>
                    <jsp:param name="searchWord" value="<%=searchWord%>"/>
                </jsp:include>
            </div>
        </div>
    </div>


<script>
    if(<%=eventStatus%> == 2){
        $('ul.tab-btn>li:last-child').find('a').addClass('on');
        $('.list-thumb li').addClass('end');
    }else{
        $('ul.tab-btn>li:first-child').find('a').addClass('on');
    }

    if (<%=searchCondition%> == 1){
        $('input[id="where1"]').prop('checked',true);
    }else{
        $('input[id="where2"]').prop('checked',true);
    }




</script>
</div>
</body>
</html>