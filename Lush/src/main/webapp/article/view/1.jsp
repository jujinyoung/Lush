<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    int categoryLink = request.getParameter("categoryLink")==null ? 1 :Integer.parseInt(request.getParameter("categoryLink"));
    int searchCondition = request.getParameter("searchCondition")==null ? 1 :Integer.parseInt(request.getParameter("searchCondition"));
    String searchWord = request.getParameter("searchWord")==null ? "" : request.getParameter("searchWord");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<title>러쉬코리아</title>

<style>

@font-face{
	font-family: 'Lush';
	src: url('/Lush/src/webapp/article/font/Lush.ttf')	
}

/* @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');  */
/* @import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap'); */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap');

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

 a:hover, a:focus, a:visited, a:active {
    text-decoration-line: none;
    color: #222;
}

a {
    text-decoration-line: none;
    color: #222;
}

.tab-btn li:not(:first-child) {
    border-left: none;
}

a:-webkit-any-link {
    color: -webkit-link;
    cursor: pointer;
}

/* 메인 */
.tab-cont .tab-inner.on {
    display: block;
}

.tab-cont .tab-inner {
    display: none;
}

.board-read-top {
    padding: 0 24px;
}

.board-read-top li:last-of-type {
    margin-top: 8px;
}

li {
    list-style: none;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
}

.board-read-top li h3 {
    font-size: 32px;
    letter-spacing: -0.9px;
}

h3 {
    display: block;
    font-size: 1.17em;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
}

.board-contents {
    margin: 32px auto 128px auto;
}

.board-img-wrap {
    position: relative;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.board-contents .mask {
    display: none;
}

.board-read .btn-wrap {
    margin-top: 74px;
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

.btn-wrap.medium button, .btn-wrap.medium a {
    width: 128px;
    height: 48px;
    line-height: 46px;
}

.border-btn {
    position: relative;
    border: 1px solid #222;
    background: #fff;
    color: #222;
    text-align: center;
}

a {
    text-decoration: none;
    color: #222;
}

b, strong {
    font-weight: 700;
}

.board-img-wrap img {
    /* display: block; */
    max-width: 100%;
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

iframe {
    overflow-clip-margin: content-box !important;
    border-width: 2px;
    border-style: inset;
    border-color: initial;
    border-image: initial;
    overflow: clip !important;
}

iframe[Attributes Style] {
    width: 560px;
    height: 315px;
    border-top-width: 0px;
    border-right-width: 0px;
    border-bottom-width: 0px;
    border-left-width: 0px;
}
/* 댓글 */
.reply {
    margin-top: 128px;
    border-top: 2px solid #535353;
    padding-top: 68px;
}

.inner {
    display: block;
    position: relative;
    margin: 0 auto;
    width: 1224px;
}

.review-title {
    padding: 0 104px;
    margin-bottom: 38px;
}

.flex {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.reply .review-title p a {
    color: #18a957;
    border-bottom: 1px solid #18a957;
}

a:hover, a:focus, a:visited, a:active {
    text-decoration: none;
}

.reply .review-wrap {
    margin-top: 48px;
}
.review-wrap {
    margin-top: 56px;
}

ol, ul, dl {
    list-style: none;
}
</style>

<%
    int contentPage = request.getParameter("currentPage")==null ? 1 :Integer.parseInt(request.getParameter("currentPage"));
%>

</head>
<body>

<header id ="header">
</header>

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
	<a href="/Lush/article/list.do?categoryLink=1" >전체</a>
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
	<div class = "tab-inner on">
		<div class="board-read">
			<ul class="board-read-top">
				<li> 
                    <h3>동물실험 대체 위해 달려온 '러쉬 프라이즈' 10주년</h3>
               </li>
           </ul>
           <div class="board-contents">
                <div class="board-img-wrap">
                   <p>&nbsp;</p>
                   <div>
                   	<b>도전의 10년</b>
                   </div>
                   <div>동물과 자연과 사람이 조화를 이루며 살아가는 이 땅에서 동물실험을 종결하기 위해 달려온 10년이었습니다.</div>
                   <div>
                   	<br>
                   </div>
				   <div>
				   동물실험 대신 인간과 연관성이 높은 효능 및 독성을 평가하는 연구 기술과 과학적이고 객관적인 검증 방법이 필요했고, 그 대안으로 떠오른 것이 바로 '동물대체시험법'입니다.
				   </div>
				   <div>
                   	<br>
                   </div>
                   <div>
                   동물실험반대를 브랜드 이념으로 지켜온 '러쉬 (Lush)'와 영국 '윤리적 소비자 연구소 (Ethical Consumer Research Association)'는 2012년 '러쉬 프라이즈 (Lush Prize)'를 신설하고 지난 10년 동안 30개국 130 수상자를 발굴하여 동물을 사용하지 않는 연구 및 기술 발전과 입법 활동을 위한 프로젝트에 총 £2.69M (한화 약 43억원)를 후원함으로써, 전 세계 동물대체시험법 활성화에 앞장서 왔습니다.
                   </div>
                   <div>
                   	<p>
                   	<img src="https://www.lush.co.kr/upload/editor/20221125/85698495-c113-4a93-885c-a92573e3d6640/editor.jpg" alt="">
                   	</p>
                   </div>
                   <div>
                   	<br>
                   </div>
                   <div>
                   <b>변화의 10년</b>
                   </div>
                   <div>
                   '러쉬 프라이즈'는 세계 최고의 권위와 규모를 자랑하는 시상식으로 자리잡으며, 동물실험을 대체하기 위해 노력해온 과학자, 신진 연구진, 기업 및 단체, 정치인을 통해 대중의 인지를 넒힘과 동시에, 정부/학계/산업 전반에 걸쳐 혁신적인 기술과 변화를 일으켰습니다.
                   </div>
                   <div>
                   	<br>
                   </div>
                   <div>
                   사람 세포 유래의 시험관 시험(in vitro), 오가노이드, 장기칩(organ-on-a-chip)을 포함한 미세생체조직시스템연구(MPS), 독성발현경로(Adverse Outcome Pathway) 연구, 통합접근시험평가(IATA) 등이 이에 해당합니다.
                   <br>
                   <br>
                   </div>
                   <div>
                   	<p>
                   	<img src="https://www.lush.co.kr/upload/editor/20221125/e57b1d20-c09f-4898-9b6a-d791b7cc9c7a0/editor.jpg" alt="">
                   	</p>
                   </div>
                   <div>
                   	<br>
                   </div>
                   <div>
                   3R(Reduce, Refine, Replace)에 해당하는 동물실험을 최소화하거나 고통을 경감시키는 것을 넘어서, 잔인하고 불필요한 동물실험을 완전히 없애는 1R을 추구하는 ‘러쉬 프라이즈'의 도전은 결코 녹록치 않았습니다. 모두가 조화로운 공존을 염원하는 시민들의 서명 운동과 보이지 않는 곳에서 외길을 걸어온 분들의 노고 없이는 불가했습니다.
                   </div>
                   <div>
                   	<br>
                   </div>
                   <div>
                   대한민국은 일찍이 화장품 산업에 동물실험을 법으로 금지하는 법안을 통과시킨 국가입니다. 현실적인 대안을 마련하는 ‘러쉬 프라이즈’에서도 2016년 이래 연속 5회에 걸쳐 수상자를 탄생시키는 저력을 이어가는 중입니다.
                   </div>
                   <div>
                   	<br>
                   </div>
                   <div>
                   사람의 눈을 모사해 실험할 수 있는 아이온어칩(eye-on-a-chip)을 개발한 펜실베이니아 대학교 허동은 박사, 토끼 피부를 이용한 자극시험의 대안으로 인체 표피 모델을 개발하여 국제표준화기구(ISO) 인증을 받은 시험관 내 시험법으로 의료기기 자극성 평가법을 개발해 국제 표준 시험법 등록에 참여한 연세대학교 치과대학 김광만 &amp; 권재성 교수팀, 인체 세포 배양으로 인공조직을 개발한 바이오솔루션 이수현 박사팀, 그리고 화학물질 유해성 심사나 위해성 평가 등에 동물실험 대신 대체시험을 확산시키는 '화평법' 개정안을 통과시킨 한정애 국회의원 (전 환경부 장관) 등이 그 주역입니다.
                   <br>
                   <br>
                   </div>
                   <div>
                   <p>
                   <img src="https://www.lush.co.kr/upload/editor/20221125/d41f6ca0-deff-4c39-99cc-224e1e7c99d50/editor.jpg" alt="">
                   </p>
                   </div>
                   <div>
                   	<br>
                   </div>
                   <div>
                   러쉬 프라이즈 10주년을 맞아 새롭게 신설된 '정치 공로상'에는 스웨덴의 Jytte Guteland, 룩셈부르크의 Tilly Metz와 함께 대한민국의 남인순 국회의원이 공동 수상했습니다. 16명의 국회의원의 동의를 얻은 '동물대체시험법 개발, 보급 및 이용 촉진을 위한 법률안’을 대표 발의한 공로입니다. 이로써 대한민국은 2016년 이래 연속 5회에 걸쳐 수상자가 탄생했습니다!&nbsp;
                   </div>
                   <div>
                   	<br>
                   </div>
                   <iframe width="560" height="315" src="https://www.youtube.com/embed/wrgHs2YJAWo" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                   <div>
                   	<b>
                   		<br>
                   		"도약의 10년"
                   	</b>
                   </div>
                   <div>
                   동물실험은 실험동물에게 고통을 준다는 윤리적 문제 외에도 사람과 실험동물의 생물학적 차이에 따른 실효성 문제가 있습니다. 화장품에 동물실험을 실시하는 국가도 여전히 많고, 법안이 마련된 국가에서도 여전히 동물실험은 늘어나는 추세입니다.
                   </div>
                   <div>
                   	<br>
                   </div>
                   <div>
                   정부/학계/산업 뿐 아니라 무엇보다 시민사회에서 끊임없이 관심을 가지고 노력을 이어가야 궁극적인 변화를 이끌어 낼 수 있습니다.
                   </div>
                   <div>
                   	<br>
                   </div>
                   <div>
                   지금, 전국 러쉬코리아 매장과 홈페이지에서는 동물실험을 대체하는 연구 기술을 더 많이 개발하고 더 널리 보급하고 더 쉽게 이용할 수 있도록 법안을 제정할 수 있도록 서명 캠페인을 진행하고 있습니다. 조속히 법안이 통과될 수 있도록, 여러분의 소중한 힘을 보태어 주시길 바랍니다.
                   </div>
                   <div>
                   	<br>
                   </div>
                   <div>
                   <a href="https://www.lush.co.kr/campaign/animalfreetesting/online" target="_self"><u><b>'동물대체시험법 제정안' 법안 통과를 위해 서명하기</b></u></a>
                   </div>
                   <div>&nbsp;</div>
                   <div>
                   타협없는 신념과 포기없는 집념으로, 동물실험이 영원히 사라지는 그날까지 맞서 싸우겠습니다. Fighting Animal Testing!
                   </div>
                   <div>
                   	<br>
                   </div>
                   <div>
                   #러쉬프라이즈 #LushPrize #동물대체시험 #SupportingAnimalFreeTesting #러쉬프라이즈10주년 #LushPrize2022 #고통없는과학 #동물대체시험법제정안 #동물권 #AnimalRights #동물실험반대 #FightingAnimalTesting #러쉬캠페인 #비건 #Vegan #비거니즘
                   <br>
                   <br>
                   </div>
                   <div>
                   	<p>
                   	<img src="https://www.lush.co.kr/upload/editor/20221125/6f5f1a0f-81b2-4aa2-be24-3168385273f70/editor.jpg" alt="">
                   	</p>
                   	<br>
                   </div>
                	<p>(참고: 'HSI Korea 서보라미의 동물대체시험' 한겨레 인터뷰, 2022년 1월)&nbsp;&nbsp;</p>
                	
                	<div class="mask"></div>
                </div>
          </div>
			
			<div class="btn-wrap right medium">
			<a href="/Lush/article/list.do" class="border-btn">목록</a>
		    </div>
		
		</div>
	</div>
</div>
<div class="reply" id="commentList">
	<div class="review">
		<div class="inner">
			<div class="review-title flex">
				<h2>총 0개의 댓글</h2>
				<p>
					<a href="#">로그인</a>
					"을 하셔야 댓글을 등록하실 수 있습니다."
				</p>
			</div>
			<div class="review-wrap">
				<ul></ul>
			</div>
		</div>
	</div>
</div>


</div>
</article>
</section>

<footer>
</footer>

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
 
 


if (<%=searchCondition%> == 1){
    $('input[id="where1"]').prop('checked',true);
}else{
    $('input[id="where2"]').prop('checked',true);
}

</script>
</body>
</html>