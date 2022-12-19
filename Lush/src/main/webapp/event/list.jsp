<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <form action="/event/list" method="get">
        <div class="board-search-wrap">
            <!-- <input name="eventStatus" type="hidden" value="2"> -->
            <!-- <input name="page" type="hidden" value="1"> -->
            <input id="where1" name="where" checked="checked" type="radio" value="CONT_SUBJECT">
            <label for="where1">제목</label>
            <input id="where2" name="where" type="radio" value="CONTENT_PC">
            <label for="where2">내용</label>
            <input name="query" type="text">
            <button type="submit" class="black-btn">검색</button>
        </div>
    </form>
    <ul class="tab-btn type3">
        <li><a class="on">진행중인 이벤트 ?</a></li>
        <li><a>선정자 발표</a></li>
        <li><a>종료된 이벤트 ?</a></li>
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

            </div>
        </div>
    </div>


    <script>
        $('ul.tab-btn>li').click(function(){
            $('ul.tab-btn>li').find('a').removeClass('on');
            $(this).find('a').addClass('on');
        })
    </script>
</div>
</body>
</html>