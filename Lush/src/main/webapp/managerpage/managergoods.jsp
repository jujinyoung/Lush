<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 관리</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<link rel="stylesheet"   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/* 전체 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');

body {
    font-size: 16px;
    font-family: 'NotoSans';
    color: #222;
    font-weight: 400;
}

body, form, div, p, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, ol, li, fieldset, th, td, input, textarea, button, select {
    margin: 0;
    padding: 0;
    font-family: "Noto Sans KR", sans-serif;
    color: #222;
}

element.style {
    padding-top: 128px;
}

section {
    min-height: calc(100vh - 96px - 320px);
}

* {
    box-sizing: border-box !important;
}

* {
    -webkit-text-size-adjust: none;
    text-shadow: none !important;
}

section {
    display: block;
}

article {
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

element.style {
    color: #757575;
}

element.style {
    margin-bottom: 10px;
}

li {
    list-style: none;
}

/* 탑 */
.flex.top {
    align-items: flex-start;
}

.flex {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.inner {
    display: block;
    position: relative;
    margin: 0 auto;
    width: 1224px;
}

/* 가운데 */
.my-page .my-contents {
    display: block;
    position: relative;
    width: 1016px;
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

.od-contents > div:first-of-type {
    margin-top: 40px;
}

.spa-voucher-box {
    display: flex;
    justify-content: center;
    align-items: center;
    width: 100%;
    border: 1px solid #eee;
    padding: 32px 0;
    margin-bottom: 80px;
}

.spa-voucher-box label {
    color: #757575;
}

.spa-voucher-box input[type="text"] {
    width: 496px;
    display: block;
    margin: 0 8px 0 24px;
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

input {
    -webkit-border-radius: 0;
}

input {
    vertical-align: middle;
}

input, textarea, select {
    letter-spacing: normal;
}

.medium-btn {
    height: 48px;
    line-height: 46px;
    width: 128px;
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

.tab-btn {
    display: flex;
    justify-content: space-between;
    align-items: center;
    width: 100%;
    margin-bottom: 47px;
}

.tab-btn.type5 li {
    width: 20%;
}

.tab-btn li {
    display: block;
    border: 1px solid #949494;
    border-bottom: 2px solid #222;
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

.od-contents > div:not(:first-of-type) {
    margin-top: 64px;
}

.od-contents .table-top {
    display: flex;
    justify-content: flex-start;
    align-items: center;
    position: relative;
}

table.border {
    border-top: 2px solid #222;
}

table.thumb-table {
    border-top: 1px solid #bdbdbd;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    table-layout: fixed;
}

table {
    display: table;
    border-collapse: separate;
    box-sizing: border-box;
    text-indent: initial;
    border-spacing: 2px;
    border-color: grey;
}

colgroup {
    display: table-column-group;
}

col {
    display: table-column;
}

tbody {
    display: table-row-group;
    vertical-align: middle;
    border-color: inherit;
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

table.thumb-table tr th {
    border-bottom: 1px solid #eee;
    font-size: 16px;
    color: #757575;
    font-weight: 400;
    height: 48px;
    vertical-align: middle;
    padding-top: 19px;
    padding-bottom: 20px;
}

th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}

.od-contents .table-wrap table th:nth-of-type(2) {
    text-align: left;
}

table.thumb-table thead th:nth-of-type(2) {
    padding-left: 24px;
}

.empty.small {
    padding: 40px 0;
    width: 100%;
    margin: 0;
    margin-right: 0;
    margin-left: 0;
}



</style>    
</head>
<body>

<!-- 헤더 -->
<header></header>

<section id="mypage" class="my-page" style="padding-top: 128px;">
	<div class="inner flex top">
		<!-- 좌측메뉴 -->
		<jsp:include page="/managerpage/managerLeft.jsp"></jsp:include>
		
		<!-- 가운데 -->
		<article class="my-contents ">
			<div class="mypage-top">
				<h2 class="mypage-title">제품관리</h2>
			</div>
			<div class="od-top">
	<div class="od-contents">
		<div class="spa-voucher-box">
				<label for="spaVoucher">상품 번호 </label>
				<input type="text" id="spaVoucher" name="" onkeypress="this.value=this.value.replace(/[^a-zA-Z-_0-9]/g,'');" placeholder="직접 등록하려면 번호를 입력해 주세요.">
				<button type="button" class="black-btn medium-btn" onclick="selfRegistSpaVoucher();">등록하기</button>
			</div>
			<ul style="margin-bottom:10px">
				<li></li>
			</ul>

			<ul class="tab-btn type5">
				<li>
					<a href="/mypage/order/2" class="on">전체</a>
				</li>
				<li>
					<a href="/mypage/order/2?voucherStatusCode=2">사용가능</a>
				</li>
				<li>
					<a href="/mypage/order/2?voucherStatusCode=6">등록완료</a>
				</li>
				<li>
					<a href="/mypage/order/2?voucherStatusCode=4">사용완료</a>
				</li>
				<li>
					<a href="/mypage/order/2?voucherStatusCode=3">사용불가</a>
				</li>
			</ul>
		<div class="table-wrap">
					<div class="table-top">
					</div>
					<table class="thumb-table border">
						<colgroup>
							<col width="100px">
							<col width="auto">
							<col width="120px">
							<col width="120px">
							<col width="120px">
							<col width="136px">
						</colgroup>
						<tbody>
						</tbody><thead>
						<tr>
							<th></th>
							<th>상품 정보</th>
							<th>가격</th>
							<th>수량</th>
							<th>상태</th>
							<th>관리</th>
						</tr>
						</thead>
						<tbody><tr>
							<td colspan="6" class="empty small">
								<p>확인되는 내역이 없습니다.</p>
							</td>
						</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	 </article>
   </div>
</section>

<!-- 푸터 -->
<footer></footer>
</body>
</html>