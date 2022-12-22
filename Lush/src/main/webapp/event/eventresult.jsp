<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
  int searchCondition = request.getParameter("searchCondition")==null ? 1 :Integer.parseInt(request.getParameter("searchCondition"));
  String searchWord = request.getParameter("searchWord")==null ? "" : request.getParameter("searchWord");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/eventresult._style.css" type="text/css">
    <title>Document</title>
</head>
<body>
<section class="table-template" id="event">
  <article class="top-visual">
    <div class="flex center">
      <h2 class="category-title">이벤트 선정자 발표</h2>
      <p class="category-sub"></p>
    </div>
    <img src="../images/eventresult/20220801182723L.png" alt="이벤트 선정자 발표">
  </article>
  <div class="inner">
    <div class="normal-table">
      <!-- 검색 -->
      <form id="lushBoardSearchParam" action="/Lush/event/eventresult.do" method="get">
        <div class="board-search-wrap">
          <input id="where1" name="searchCondition" type="radio" value="1">
          <label for="where1">제목</label>
          <input id="where2" name="searchCondition" type="radio" value="2">
          <label for="where2">내용</label>
          <input name="searchWord" type="text" placeholder="검색 단어를 입력해 주세요." value="<%=searchWord%>">
          <input id="categoryLink" name="categoryLink" type="hidden" value=""/>
          <input id="page" name="page" type="hidden" value="1"/>
          <button type="submit" class="black-btn">검색</button>
      </div>
      </form><!-- 검색 //-->

      <ul class="tab-btn type3">
        <li>
          <a href="/Lush/event/list.do?eventStatus=1">진행중인 이벤트</a>
        </li>
        <li>
          <a href="/Lush/event/eventresult.do" class="on">선정자 발표</a>
        </li>
        <li>
          <a href="/Lush/event/list.do?eventStatus=2">종료된 이벤트</a>
        </li>
      </ul>
      <div class="tab-cont">
        <div class="tab-inner on">
          <table class="list-table">
            <colgroup>
              <col width="100px">
              <col width="auto">
              <col width="130px">
            </colgroup>
            <thead>
            <tr>
              <th>번호</th>
              <th>제목</th>
              <th>날짜</th>
            </tr>
            </thead>
            <tbody>

            </tbody>
          </table>
          <!-- 페이징 영역 -->
            <jsp:include page="/WEB-INF/inc/event/paging.jsp">
              <jsp:param name="eventStatus" value="null"/>
              <jsp:param name="searchCondition" value="<%=searchCondition%>"/>
              <jsp:param name="searchWord" value="<%=searchWord%>"/>
            </jsp:include>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script>
  if (<%=searchCondition%> == 1){
    $('input[id="where1"]').prop('checked',true);
  }else{
    $('input[id="where2"]').prop('checked',true);
  }
</script>
</body>
</html>