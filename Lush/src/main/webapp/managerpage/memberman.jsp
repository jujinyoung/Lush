<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/* 전체 */

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');

* {
    box-sizing: border-box !important;
}

* {
    -webkit-text-size-adjust: none;
    text-shadow: none !important;
}

article {
    display: block;
}

body, form, div, p, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, ol, li, fieldset, th, td, input, textarea, button, select {
    margin: 0;
    padding: 0;
    font-family: "Noto Sans KR", sans-serif;
    color: #222;
}

body {
    font-size: 16px;
    font-family: 'NotoSans';
    color: #222;
    font-weight: 400;
}

div {
    display: block;
}

ol, ul, dl {
    list-style: none;
}

section {
    min-height: calc(100vh - 96px - 320px);
}

section {
    display: block;
}

form {
    display: block;
    margin-top: 0em;
}

/* 탑 */
.my-page {
    margin-top: 64px;
}


.my-page .my-contents {
    display: block;
    position: relative;
    width: 1000px;
    height: auto;
}

.mypage-top {
    display: block;
    margin-bottom: 42px;
}

.mypage-top .mypage-title {
    font-size: 26px;
    line-height: 38px;
    letter-spacing: -0.72px;
}

/* 검색 */
.flex.left {
    justify-content: flex-start;
}

.inquiry-top ul {
    margin-top: 48px;
    border: 1px solid #eee;
    padding: 24px;
}

.flex {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.flex.top {
    align-items: flex-start;
}

.inquiry-top ul li:first-of-type {
    color: #757575;
}

.inquiry-top ul li {
    margin-right: 24px;
}

li {
    list-style: none;
}

.inner {
    display: block;
    position: relative;
    margin: 0 auto;
    width: 1224px;
}

form {
    display: block;
    margin-top: 0em;
}

.board-search-wrap {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 80px;
}

input[type="radio"] {
    display: none;
    position: absolute;
    opacity: 0;
    width: 1px;
    height: 1px;
    padding: 0;
    margin: -1px;
    overflow: hidden;
    clip: rect(0,0,0,0);
    border: none;
}

input[type="radio"] {
    border: none;
    -webkit-appearance: none;
}

input {
    -webkit-border-radius: 0;
}

input {
    vertical-align: middle;
}

input, textarea, select {
    letter-spacing: normal;
}

.board-search-wrap input[type='radio'] + label:last-of-type {
    margin-right: 60px;
}


.board-search-wrap input[type='radio'] + label {
    margin-right: 32px;
} 

input[type="radio"]:checked + label {
    background: url(../images/ico/radio_on.svg) no-repeat center left;
}

input[type="radio"] + label {
    display: inline-block;
    position: relative;
    cursor: pointer;
    background: url(../images/ico/radio_off.svg) no-repeat center left;
    padding-left: 28px;
    min-width: 18px;
    min-height: 18px;
}

label {
    cursor: default;
}

.board-search-wrap input[type='text'] {
    width: 257px;
    margin-bottom: 0;
}

input[type="text"] {
    background: #fff;
    color: #222;
    font-size: 1em;
    padding: 0 10px;
    border: 1px solid #949494;
    height: 48px;
    line-height: 46px;
}

input[type="text"], input[type="password"] {
    -webkit-appearance: none;
}

.board-search-wrap button {
    width: 127px;
    height: 48px;
    line-height: 46px;
    font-size: 14px;
    font-weight: 700;
    margin-left: 8px;
}

.black-btn {
    position: relative;
    background: #222;
    color: #fff !important;
    text-align: center;
    border: 1px solid #222;
}

button, input[type="button"], input[type="submit"], input[type="reset"], input[type="file"] {
    -webkit-appearance: button;
    border-radius: 0;
    outline: none;
    cursor: pointer;
    border: none;
    background: none;
    font-size: 1em;
}

input[type="radio" i] {
    background-color: initial;
    cursor: default;
    appearance: auto;
    box-sizing: border-box;
    margin: 3px 3px 0px 5px;
    padding: initial;
    border: initial;
}

input {
    writing-mode: horizontal-tb !important;
    font-style: ;
    font-variant-ligatures: ;
    font-variant-caps: ;
    font-variant-numeric: ;
    font-variant-east-asian: ;
    font-weight: ;
    font-stretch: ;
    font-size: ;
    font-family: ;
    text-rendering: auto;
    color: fieldtext;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: start;
    appearance: auto;
    -webkit-rtl-ordering: logical;
    cursor: text;
    background-color: field;
    margin: 0em;
    padding: 1px 2px;
    border-width: 2px;
    border-style: inset;
    border-color: -internal-light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
    border-image: initial;
}


.btn-wrap.right {
    justify-content: flex-end;
}

.btn-wrap {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
}

/* 하단 */
.inq-contents {
    margin-top: 40px;
}

.inq-contents .inq-table-top {
    position: relative;
}

.inq-contents table {
    margin-top: 32px;
}

table.list-table {
    border-top: 1px solid #bdbdbd;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    table-layout: fixed;
}

colgroup {
    display: table-column-group;
}

thead {
    display: table-header-group;
    vertical-align: middle;
    border-color: inherit;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

table.list-table tr th {
    border-bottom: 1px solid #eee;
    font-size: 16px;
    line-height: 24px;
    color: #757575;
    font-weight: 400;
    padding-top: 19px;
    padding-bottom: 20px;
}

th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
}

div.inquiry-top{
	width: 162px;
}

div.board-search-wrap{
	width: 1016px;
}

div.inq-contents{
	width: 1016px;
}

/* 페이징처리 */
.list-thumb + .paginate {
    margin-top: 32px;
}

.paginate {
    display: block;
    position: relative;
    margin: 100px auto;
}

.paginate ul {
    display: flex;
    justify-content: center;
    align-items: center;
    position: relative;
    width: 100%;
}

.paginate ul li {
    display: block;
    padding: 0 8px;
}

li {
    list-style: none;
}

.paginate ul li a.num.on {
    border-bottom: 1px solid #535353;
    pointer-events: none;
    cursor: default;
}

.paginate ul li a.num {
    font-size: 14px;
    line-height: 19px;
    border-bottom: 1px solid #fff;
    text-decoration: none;
}

.paginate ul li a {
    display: block;
    height: 20px;
    text-align: center;
    color: #222;
}

a {
    text-decoration: none;
    color: #222;
}

.paginate ul li.prev, .paginate ul li.last {
    padding-left: 0;
}

a:hover, a:focus, a:visited, a:active {
    text-decoration: none; 
    color: black;
}

li a:link{
color: black;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
}

.paginate ul li a img {
    display: block;
}

img {
    border: 0;
    vertical-align: middle;
}

fieldset, img {
    border: 0;
}

img {
    overflow-clip-margin: content-box;
    overflow: clip;
}


table.list-table {
  border-collapse: collapse;
  text-align: left;
  line-height: 1.5;
  border-top: 1px solid #ccc;
  border-bottom: 1px solid #ccc;
  margin: 20px 10px;
}

table.list-table th {
  width: 150px;
  padding: 10px;
  font-weight: bold;
  vertical-align: top;
}

table.list-table td {
  width: 350px;
  padding: 10px;
  vertical-align: top;
}
</style>

<%
	int contentPage = request.getParameter("currentPage")==null ? 1 :Integer.parseInt(request.getParameter("currentPage"));
    int searchCondition = request.getParameter("searchCondition")==null ? 1 :Integer.parseInt(request.getParameter("searchCondition"));
    String searchWord = request.getParameter("searchWord")==null ? "" : request.getParameter("searchWord");
%>
</head>
<body>
<body>
<header id ="header"></header>
<form id="searchParam" action="/Lush/managerpage/memberman.do" method="get">
<section id="mypage-inquiry" class="my-page" style="padding-top: 128px;">	
<div class="inner flex top">

<!-- 사이드 -->
<jsp:include page="/managerpage/managerLeft.jsp"></jsp:include>
<!-- 가운데 -->
<article class="my-contents inquiry">
		<div class="mypage-top">
			<h2 class="mypage-title">회원관리</h2>
		</div>
		
		<div class="inner">
		
				<div class="board-search-wrap">
            		<input name="currentPage" type="hidden" value="<%=contentPage%>">
            		<input id="where1" name="searchCondition" type="radio" value="1">
            		<label for="where1">이름</label>
            		<input id="where2" name="searchCondition" type="radio" value="2">
            		<label for="where2">아이디</label>
            		<input name="searchWord" type="text" value="<%=searchWord%>">
            		<button type="submit" class="black-btn">검색</button>
        </div>
<div>
</div>
	
		<div class="inq-contents">
			<div class="inq-table-top">
			</div>
			
		<table class="list-table">
		
				<col width="30px">
				<col width="30px">
				<col width="30px">
				<col width="30px">
			
			
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>아이디</th>
					<th>이메일</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="manager" items="${managers}">
				<tr>
						 <td>
						 <a href="/Lush/managerpage/view.do?meID=${manager.me_id}&currentPage=${pageBlock.currentPage}">
						 ${manager.me_id}
						 </a>
						 </td>
                         <td>
                         <a href="/Lush/managerpage/view.do?meID=${manager.me_id}&currentPage=${pageBlock.currentPage}">
                         ${manager.me_name}
                         </a>
                         </td>
                         <td>
                         <a href="/Lush/managerpage/view.do?meID=${manager.me_id}&currentPage=${pageBlock.currentPage}">
                         ${manager.me_loginid}
                         </a>
                         </td>
                         <td>
                         <a href="/Lush/managerpage/view.do?meID=${manager.me_id}&currentPage=${pageBlock.currentPage}">
                         ${manager.me_email}
                         </a>
                         </td>
				</tr>
				 </c:forEach>
			</tbody>
			</table>
			
			<div class="paginate">
					<ul>
						<c:if test="${pageBlock.prev}">
                            <li class="first"><a href="/Lush/managerpage/memberman.do?&currentPage=${pageBlock.startOfPageBlock-1}&searchCondition=${searchCondition}&searchWord=${searchWord}"> &laquo; </a></li></c:if>
                        <c:forEach begin="${pageBlock.startOfPageBlock}" end="${pageBlock.endOfPageBlock}" var="i" step="1">
                            <c:choose>
                                <c:when test="${pageBlock.currentPage eq i}">
                                    <li><a href="#" class="num on">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="/Lush/managerpage/memberman.do?&currentPage=${i}&searchCondition=${searchCondition}&searchWord=${searchWord}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${pageBlock.next}">
                            <li class="last"><a href="/Lush/managerpage/memberman.do?&currentPage=${pageBlock.endOfPageBlock+1}&searchCondition=${searchCondition}&searchWord=${searchWord}"> &raquo; </a></li>
                        </c:if>
					</ul>
				</div>
				</div>
					
			</div>
		</article>
	</div>
	</section>
<div>
<input type="hidden" name="_csrf" value="3ef3ef5a-8ab4-4a3a-bcf9-b4a7637bf34d"></div>
</form>
			
<!-- 푸터 -->
<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

<script>
if (<%=searchCondition%> == 1){
    $('input[id="where1"]').prop('checked',true);
}else{
    $('input[id="where2"]').prop('checked',true);
}
</script>
</body>
</html>