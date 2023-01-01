<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>러쉬이야기</title>
    
<!-- 모달창(삭제하기) -->
<link rel="stylesheet"   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>



<style>

@font-face{
	font-family: 'Lush';
	src: url('/Lush/src/webapp/article/font/Lush.ttf')	
}

/* @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');  */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');

/* 전체 */
element.style {
    padding-top: 128px;
}
section {
    min-height: calc(100vh - 96px - 320px);
}

section {
    display: block;
}

.story-wrap {
    margin-top: 56px;
}

body, form, div, p, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, ol, li, fieldset, th, td, input, textarea, button, select {
    margin: 0;
    padding: 0;
    font-family: "Noto Sans KR", sans-serif;
    color: #222;
}

strong, em {
    font-style: normal;
}

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

 
html {
    -webkit-user-select: none;
    -webkit-touch-callout: none;
    -webkit-tap-highlight-color: rgba(0,0,0,0);
}

body {
    font-size: 16px;
    font-family: 'NotoSans';
    color: #222;
    font-weight: 400;
}

/* 상단 이미지 */
.top-visual {
    display: block;
    position: relative;
    width: 100%;
    height: 456px;
    margin-bottom: 40px;
    overflow: hidden;
    background-size: contain;
    background-position: center center;
}

.flex.center {
    justify-content: center;
}

.top-visual > div {
    position: relative;
    width: 100%;
    height: 100%;
    flex-direction: column;
    z-index: 2;
    background: rgba(34,34,34,.3);
}

.flex {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

div {
    display: block;
}

h2 {
    display: block;
    font-size: 1.5em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

img {
    overflow-clip-margin: content-box;
    overflow: clip;
}

img {
    border: 0;
    vertical-align: middle;
}

.top-visual img {
    position: absolute;
    min-width: 100%;
    display: block;
    z-index: 1;
    left: 50%;
    top: 50%;
    min-height: 100%;
    transform: translate(-50%,-50%);
}

.top-visual .category-title {
    display: block;
    font-family: 'Lush';
    font-size: 70px;
    line-height: 1em;
    color: #fafafa;
    letter-spacing: -3px;
    font-weight: 500;
}

/* 검색 */
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

/* 카테고리 */
.tab-btn {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    margin-bottom: 47px;
}

ol, ul, dl {
    list-style: none;
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
  
li {
    text-align: -webkit-match-parent;
}
  
.tab-btn.type5 li {
    width: 20%;
}

ul.tab-btn.type5{
	margin: 0px 0px 0px;
	padding: 0px 0px 0px 0px;
}

.tab-btn li {
    display: block;
    border: 1px solid #949494;
    border-bottom: 2px solid #222;
}

li {
    list-style: none;
}

.tab-btn li a.on {
    background: #222;
    color: #fff;
    font-weight: 700;
    width: calc(100% + 2px);;
    margin-left: -1px;
    margin-right: -1px;
    height: 65px;
    margin-top: -1px;
}

.tab-btn li a {
    position: relative;
    display: block;
    width: 100%;
    height: 64px;
    line-height: 62px;
    text-align: center;
    color: #949494;
    font-size: 16px;
    letter-spacing: -0.45px;
}


.tab-btn li:not(:first-child) {
    border-left: none;
}

a:-webkit-any-link {
/*     color: -webkit-link; */
    cursor: pointer;
}

/* 메인 */
.tab-cont .tab-inner.on {
    display: block;
}

.tab-btn li:not(:first-child) {
  border-left: none;
}

.tab-cont .tab-inner {
    display: none;
}

.inner {
    display: block;
    position: relative;
    margin: 0 auto;
    width: 1224px;
}

.list-thumb {
    display: flex;
    justify-content: flex-start;
    align-items: flex-start;
    flex-wrap: wrap;
}

 .list-thumb li:nth-of-type(3n) {
    margin-right: 0;
}
 
.list-thumb li {
    width: 392px;
    margin-right: 24px;
    margin-bottom: 48px;
}

.list-thumb li .article-thumb {
    display: block;
    position: relative;
    width: 100%;
    padding-top: 278px;
    max-height: 278px;
    overflow: hidden;
}


.list-thumb li .article-title {
    display: block;
    margin: 10px auto 0px auto;
    font-size: 18px;
    letter-spacing: -.5px;
    font-weight: 700;
    text-align: center;
}

.list-thumb li .article-cate {
    display: block;
    font-size: 18px;
    letter-spacing: -.5px;
    text-align: center;
}

.list-thumb li .article-thumb img {
  display: block;
  position: absolute;
  min-height: 100%;
  left: 50%;
  top: 50%;
  transform: translate(-50%,-50%);
  height: 100%;
  width: auto;
}

.list-thumb li.end .article-thumb .mask {
  display: block;
  position: absolute;
  left: 0;
  top: 0;
  width: 100%;
  height: 100%;
  background: rgba(34,34,34,.7);
  z-index: 2;
}

.list-thumb li .article-thumb .mask {
  display: none;
}

.list-thumb li.end .article-thumb .mask::after {
  content: '종료';
  display: block;
  position: absolute;
  width: 100%;
  opacity: 1;
  color: #fff;
  text-align: center;
  font-size: 22px;
  top: 50%;
  margin-top: -17px;
  font-weight: 500;
}

img {
    border: 0;
    vertical-align: middle;
}

/* img {
    overflow-clip-margin: content-box;
    overflow: clip;
}
 */
fieldset, img {
    border: 0;
}

ul.list-thumb{
	padding: 0px 0px 0px 0px;
	
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
</style>
       
<%
    int categoryLink = request.getParameter("categoryLink")==null ? 1 :Integer.parseInt(request.getParameter("categoryLink"));
    int contentPage = request.getParameter("currentPage")==null ? 1 :Integer.parseInt(request.getParameter("currentPage"));
    int searchCondition = request.getParameter("searchCondition")==null ? 1 :Integer.parseInt(request.getParameter("searchCondition"));
    String searchWord = request.getParameter("searchWord")==null ? "" : request.getParameter("searchWord");
%>
        
</head>

<body>

<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>

<!-- 탑이미지 -->
<section id="story" style="padding-top: 128px;">
<article class="top-visual">
	<div class = "flex center">
		<h2 class="category-title">Lush story</h2>
		<p class="sub"></p>
	</div>
	<img src="https://www.lush.co.kr/upload/article/20220215105233L.jpg" alt="러쉬 이야기">
</article>


<article class="story-wrap">
<!-- 검색 -->
<div class="inner">

<form id="lushBoardSearchParam" action="/Lush/article/list.do" method="get">
<div class="board-search-wrap">
            <input name="categoryLink" type="hidden" value="<%=categoryLink%>">
            <input name="currentPage" type="hidden" value="<%=contentPage%>">
            <input id="where1" name="searchCondition" type="radio" value="1">
            <label for="where1">제목</label>
            <input id="where2" name="searchCondition" type="radio" value="2">
            <label for="where2">내용</label>
            <input name="searchWord" type="text" value="<%=searchWord%>">
            <button type="submit" class="black-btn">검색</button>
        </div>
<div>
<input type="hidden" name="_csrf" value="3b0351a8-f783-4f60-86aa-5cc142894a38">
</div>
</form>

<!--카테고리  -->
<ul class="tab-btn type5">
<li>
	<a href="/Lush/article/list.do?categoryLink=1">전체</a>
</li>
<li>
	<a href="/Lush/article/list.do?categoryLink=2">브랜드</a>
</li>
<li>
	<a href="/Lush/article/list.do?categoryLink=3">제품</a>
</li>
<li>
	<a href="/Lush/article/list.do?categoryLink=4">캠페인</a>
</li>
<li>
	<a href="/Lush/article/list.do?categoryLink=5">원재료</a>
</li>
</ul>

<div class="tab-cont">
	<div class="tab-inner on">
		<div class="article-list">
			<div class="inner">
				<ul class="list-thumb">
					<c:forEach var="article" items="${articles}">
                        <li>
                            <a href="/Lush/article/view.do?stID=${article.st_id}&categoryLink=<%=categoryLink%>&currentPage=${pageBlock.currentPage}" class="article-thumb">
                                <img src="${article.st_image}" alt="${article.st_title}">
                            </a>
                            <a href="/Lush/article/view.do?stID=${article.st_id}&categoryLink=<%=categoryLink%>&currentPage=${pageBlock.currentPage}" class="article-title">
                                ${article.st_title}
                            </a>
                            <a href="/Lush/article/view.do?stID=${article.st_id}&categoryLink=<%=categoryLink%>&currentPage=${pageBlock.currentPage}" class="article-cate">
                                ${article.st_stitle}
                            </a>
                        </li>
                    </c:forEach>
				</ul>
				<div class="paginate">
					<ul>
						<c:if test="${pageBlock.prev}">
                            <li class="first"><a href="/Lush/article/list.do?categoryLink=<%=categoryLink%>&currentPage=${pageBlock.startOfPageBlock-1}&searchCondition=${searchCondition}&searchWord=${searchWord}"> &laquo; </a></li></c:if>
                        <c:forEach begin="${pageBlock.startOfPageBlock}" end="${pageBlock.endOfPageBlock}" var="i" step="1">
                            <c:choose>
                                <c:when test="${pageBlock.currentPage eq i}">
                                    <li><a href="#" class="num on">${i}</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li><a href="/Lush/article/list.do?categoryLink=<%=categoryLink%>&currentPage=${i}&searchCondition=${searchCondition}&searchWord=${searchWord}">${i}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        <c:if test="${pageBlock.next}">
                            <li class="last"><a href="Lush/article/list.do?categoryLink=<%=categoryLink%>&currentPage=${pageBlock.endOfPageBlock+1}&searchCondition=${searchCondition}&searchWord=${searchWord}"> &raquo; </a></li>
                        </c:if>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</article>
</section>


<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>
<!-- 카테고리 -->
<script>
 
 if(<%=categoryLink%> == 1){
	$('ul.tab-btn>li:first-child').find('a').addClass('on');
    $('.list-thumb li').addClass('end');
}else if (<%=categoryLink%> == 2){
   $('ul.tab-btn>li:nth-child(2)').find('a').addClass('on');
   $('.list-thumb li').addClass('end');
}else if (<%=categoryLink%> == 3){
	   $('ul.tab-btn>li:nth-child(3)').find('a').addClass('on');
	   $('.list-thumb li').addClass('end');
}else if (<%=categoryLink%> == 4){
	   $('ul.tab-btn>li:nth-child(4)').find('a').addClass('on');
	   $('.list-thumb li').addClass('end');
}else if (<%=categoryLink%> == 5){
	   $('ul.tab-btn>li:nth-child(5)').find('a').addClass('on');
	   $('.list-thumb li').addClass('end');
}   
 
 
  
 
/*  

 $('ul.tab-btn>li').click(function(){
     $('ul.tab-btn>li').find('a').removeClass('on');
     $(this).find('a').addClass('on');
 })
 */
if (<%=searchCondition%> == 1){
    $('input[id="where1"]').prop('checked',true);
}else{
    $('input[id="where2"]').prop('checked',true);
}

</script>
 <script>

 </script>
  <!-- 
    <script>
        $('ul.tab-btn>li').click(function(){
            $('ul.tab-btn>li').find('a').removeClass('on');
            $(this).find('a').addClass('on');
        })
    </script>
 

페이징    
    <script>
    $(function() {
       $("#lushBoardSearchParam").validator(function() {
           $("#page").val(1);
       });
    })
     -->
</body>
</html>

