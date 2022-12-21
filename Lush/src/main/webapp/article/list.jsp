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

@font-face {
font-family: 'lush';
src: url('font/lush-hw/lushHandwritten_wlat_bd-webfont.woff2') format('woff2'),
url('font/lush-hw/lushHandwritten_wlat_bd-webfont.woff') format('woff'),
url('font/lush-hw/lushHandwritten_wlat_bd-webfont.ttf') format('truetype');
}

/* 전체 */
body, form, div, p, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, ol, li, fieldset, th, td, input, textarea, button, select {
    margin: 0;
    padding: 0;
    font-family: "NotoSans",dotum,'돋움';
    color: #222;
}

* {
    box-sizing: border-box !important;
}

* {
    -webkit-text-size-adjust: none;
    text-shadow: none !important;
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
    font-family: 'lush';
    font-size: 96px;
    line-height: 1em;
    color: #fafafa;
    letter-spacing: -3px;
    font-weight: 500;
}

/* 검색 */
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
    width: calc(100% + 2px);
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

a:hover, a:focus, a:visited, a:active {
    text-decoration: none;
}

a {
    text-decoration: none;
    color: #222;
}

.tab-btn li:not(:first-child) {
    border-left: none;
}

a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
    text-decoration: underline;
}

/* 메인 */
.tab-cont .tab-inner.on {
    display: block;
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

a {
    text-decoration: none;
    color: #222;
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
        
</head>

<body>

<header>
</header>

<!-- 탑이미지 -->
<section>
<article class="top-visual">
	<div class = "flex center">
		<h2 class="category-title">러쉬 이야기</h2>
		<p class="sub"></p>
	</div>
	<img src="https://www.lush.co.kr/upload/article/20220215105233L.jpg" alt="러쉬 이야기">
</article>


<article>
<!-- 검색 -->
<div class="inner">

<form id="lushBoardSearchParam" action="/Lush/article/list.do" method="get">
<div class="board-search-wrap">
<input id="where1" name="where" checked="checked" type="radio" value="CONT_SUBJECT">
<label for="where1">제목</label>
<input id="where2" name="where" type="radio" value="CONTENT_PC">
<label for="where2">내용</label>
<input id="query" name="query" placeholder="검색 단어를 입력해 주세요." type="text" value="">
<input id="categoryLink" name="categoryLink" type="hidden" value="">
<input id="page" name="page" type="hidden" value="1">
<button type="submit" class="black-btn">검색</button>
</div>
<div>
<input type="hidden" name="_csrf" value="3b0351a8-f783-4f60-86aa-5cc142894a38">
</div>
</form>

<!--카테고리  -->
<ul class="tab-btn type5">
<li>
	<a href="/Lush/article/list.do" class="on">전체 ?</a>
</li>
<li>
	<a href="#">브랜드 ? </a>
</li>
<li>
	<a href="#">제품 ? </a>
</li>
<li>
	<a href="#">캠페인 ?</a>
</li>
<li>
	<a href="#">원재료 ?</a>
</li>
</ul>

<div class="tab-cont">
	<div class="tab-inner on">
		<div class="article-list">
			<div class="inner">
				<ul class="list-thumb">
					<c:forEach var="article" items="${articles}">
                        <li>
                            <a class="article-thumb">
                                <img src="${article.st_image}" alt="${article.st_title}">
                            </a>
                            <a class="article-title">
                                ${article.st_title} ?
                            </a>
                            <a class="article-cate">
                                ${article.st_stitle}
                            </a>
                        </li>
                    </c:forEach>
				</ul>
				<div class="paginate">
					<ul>
						<li>
							<a href="#" class="num on">1</a>
						</li>
						<li>
							<a href="#" class="num">2</a>
						</li>
						<li>
							<a href="#" class="num">3</a>
						</li>
						<li>
							<a href="#" class="num">4</a>
						</li>
						<li>
							<a href="#" class="num">5</a>
						</li>
						<li>
							<a href="#" class="num">6</a>
						</li>
						<li>
							<a href="#" class="num">7</a>
						</li>
						<li>
							<a href="#" class="num">8</a>
						</li>
						<li>
							<a href="#" class="num">9</a>
						</li>
						<li>
							<a href="#" class="num">10</a>
						</li>
						<li class="next">
							<a href="#">
								<img src="https://www.lush.co.kr/content/renewal/pc/images/ico/page_next.svg" alt="다음 페이지로">
							</a>
						</li>
						<li class="last">
							<a href="#">
								<img src="https://www.lush.co.kr/content/renewal/pc/images/ico/page_last.svg" alt="마지막 페이지로">
							</a>	
						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</article>
</section>

<footer>
</footer>
<!-- 카테고리 -->
    <script>
        $('ul.tab-btn>li').click(function(){
            $('ul.tab-btn>li').find('a').removeClass('on');
            $(this).find('a').addClass('on');
        })
    </script>

<!-- 페이징 -->    
    <script>
    $(function() {
       $("#lushBoardSearchParam").validator(function() {
           $("#page").val(1);
       });
    })
</script>
</body>
</html>

