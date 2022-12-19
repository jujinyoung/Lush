<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
    int eventStatus = request.getParameter("eventStatus")==null ? 1 :Integer.parseInt(request.getParameter("eventStatus"));
    int contentPage = request.getParameter("currentPage")==null ? 1 :Integer.parseInt(request.getParameter("page"));
    String searchWord = request.getParameter("searchWord")==null ? "" : request.getParameter("searchWord");
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
    <form action="/Lush/event/list.do" method="get">
        <div class="board-search-wrap">
            <input name="eventStatus" type="hidden" value="<%=eventStatus%>">
            <input name="currentPage" type="hidden" value="<%=contentPage%>">
            <input id="where1" name="searchCondition" checked="checked" type="radio" value="1">
            <label for="where1">제목</label>
            <input id="where2" name="searchCondition" type="radio" value="2">
            <label for="where2">내용</label>
            <input name="searchWord" type="text" value="<%=searchWord%>">
            <button type="submit" class="black-btn">검색</button>
        </div>
    </form>
    <ul class="tab-btn type3">
        <li><a href="/Lush/event/list.do?eventStatus=1">진행중인 이벤트 ?</a></li>
        <li><a href="/Lush/event/eventresult.do">선정자 발표</a></li>
        <li><a href="/Lush/event/list.do?eventStatus=2">종료된 이벤트 ?</a></li>
    </ul>
    <div class="tab-cont">
        <div class="tab-inner-on">
            <div class="inner">
                <ul class="list-thumb">
                    <!-- db에서 이벤트정보가져다가 쓰기 -->
                    <c:forEach var="event" items="${events}">
                        <li>
                            <a class="article-thumb">
                                <img src="${event.image}" alt="${event.title}">
                            </a>
                            <a class="article-title">
                                ${event.title} ?
                            </a>
                            <a class="article-cate">
                                ${event.subtitle}
                            </a>
                            <p class="date">${event.rdate}~${event.edate}</p>
                        </li>
                    </c:forEach>
                </ul>
                <div class="paginate">
                    <ul>
                        <c:if test="${pageBlock.prev}">
                            <li class="prev"><a href="/Lush/event/list.do?eventStatus=<%=eventStatus%>&currentpage=${pageBlock.startOfPageBlock-1}&searchCondition=${searchCondition}&searchWord=${searchWord}"> &laquo; </a></li></c:if>
                        <c:forEach begin="${pageBlock.startOfPageBlock}" end="${pageBlock.endOfPageBlock}" var="i" step="1">
                            <c:choose>
                                <c:when test="${pageBlock.currentPage eq i}">
                                    <li><a href="#" class="num on">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="/Lush/event/list.do?eventStatus=<%=eventStatus%>&currentpage=${i}&searchCondition=${searchCondition}&searchWord=${searchWord}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${pageBlock.next}">
                            <li class="next"><a href="Lush/event/list.do?eventStatus=<%=eventStatus%>&currentpage=${pageBlock.endOfPageBlock+1}&searchCondition=${searchCondition}&searchWord=${searchWord}"> &raquo; </a></li>
                        </c:if>
                    </ul>
                </div>
            </div>
        </div>
    </div>


<script>
    if(<%=eventStatus%> == 2){
        $('ul.tab-btn>li:last-child').find('a').addClass('on');
    }else{
        $('ul.tab-btn>li:first-child').find('a').addClass('on');
    }

</script>
</div>
</body>
</html>