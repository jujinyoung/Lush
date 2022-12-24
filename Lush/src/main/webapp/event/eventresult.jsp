<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="css/eventresult._style.css" type="text/css">
    <link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
    <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

    <title>러쉬코리아</title>
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
          <input name="searchWord" type="text" placeholder="검색 단어를 입력해 주세요." value="${searchWord}">
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
              <c:forEach var="result" items="${eventResultTitles}" varStatus="status">
                <tr>
                  <td class="center">${totalRecords-status.index}</td>
                  <td>
                    <a><${result.ev_title}> 이벤트 선정자 발표</a>
<%--                    무슨기준으로 hot이 결정되는지 모르겠음--%>
                    <c:if test="${result.eventResult.es_readed}>=200">
                      <span class="ico-hot">hot</span>
                    </c:if>
                    <c:if test="${status.begin}">
                      <span class="ico-new">new</span>
                    </c:if>
                  </td>
                  <td class="center">${result.eventResult.es_rdate}</td>
                </tr>
              </c:forEach>
            </tbody>
          </table>
          <!-- 페이징 영역 -->
          <div class="paginate">
            <ul>
              <c:if test="${pageBlock.prev}">
                <li class="first"><a href="/Lush/event/eventresult?currentPage=${pageBlock.startOfPageBlock-1}&searchCondition=${searchCondition}&searchWord=${searchWord}"> &laquo; </a></li></c:if>
              <c:forEach begin="${pageBlock.startOfPageBlock}" end="${pageBlock.endOfPageBlock}" var="i" step="1">
                <c:choose>
                  <c:when test="${pageBlock.currentPage eq i}">
                    <li><a href="#" class="num on">${i}</a></li>
                  </c:when>
                  <c:otherwise>
                    <li><a href="/Lush/event/eventresult?currentPage=${i}&searchCondition=${searchCondition}&searchWord=${searchWord}">${i}</a></li>
                  </c:otherwise>
                </c:choose>
              </c:forEach>
              <c:if test="${pageBlock.next}">
                <li class="last"><a href="/Lush/event/eventresult?currentPage=${pageBlock.endOfPageBlock+1}&searchCondition=${searchCondition}&searchWord=${searchWord}>"> &raquo; </a></li>
              </c:if>
            </ul>
          </div>
          </div>
        </div>
      </div>
    </div>
  </div>
</section>

<script>
  if (${searchCondition} == 1){
    $('input#where1').prop('checked',true);
  }else{
    $('input#where2').prop('checked',true);
  }
</script>
</body>
</html>