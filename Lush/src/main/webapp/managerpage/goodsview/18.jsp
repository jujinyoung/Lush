<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
	int categoryLink = request.getParameter("categoryLink")==null ? 1 :Integer.parseInt(request.getParameter("categoryLink"));
	int contentPage = request.getParameter("currentPage")==null ? 1 :Integer.parseInt(request.getParameter("currentPage"));
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
<title>주문수정</title>

<style>
/* 공통 */

@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');


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

body {
    font-size: 16px;
    font-family: 'Noto Sans KR';
    color: #222;
    font-weight: 400;
}

body, form, div, p, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, ol, li, fieldset, th, td, input, textarea, button, select {
    margin: 0;
    padding: 0;
    font-family: "Noto Sans KR", sans-serif;
    color: #222;
}

section {
    min-height: calc(100vh - 96px - 320px);
}

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

div {
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

/* 우측 */
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

.mypage-top {
    display: block;
    margin-bottom: 42px;
}

.modify-table .table-wrap .require-notice {
    position: relative;
    padding-left: 139px;
    color: #757575;
    font-size: 16px;
    line-height: 24px;
    margin-bottom: 8px;
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

input {
    -webkit-border-radius: 0;
}

input {
    vertical-align: middle;
}

input, textarea, select {
    letter-spacing: normal;
}

colgroup {
    display: table-column-group;
}

col {
    display: table-column;
}

tr {
    display: table-row;
    vertical-align: inherit;
    border-color: inherit;
}

.modify-table .no-border-table th {
    padding: 19px 10px 8px 15px;
    word-break: keep-all;
}
table.no-border-table tr th {
    position: relative;
    padding: 20px 0px 0px 26px;
    color: #757575;
    text-align: left;
    letter-spacing: -0.45px;
    vertical-align: top;
}

th {
    display: table-cell;
    vertical-align: inherit;
    font-weight: bold;
    text-align: -internal-center;
}

table.no-border-table tr td {
    position: relative;
    padding: 8px 0;
    width: 100%;
}

td {
    display: table-cell;
    vertical-align: inherit;
}

.modify-table .no-border-table td input:disabled {
    color: #757575;
}

.modify-table .no-border-table td input[type="text"], .modify-table .no-border-table td input[type="password"] {
    width: 496px;
}

input[type="text"]:read-only {
    cursor: default;
    background: #eee;
}

table.no-border-table tr td input {
    width: 100%;
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

.btn-wrap {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.btn-wrap.large button, .btn-wrap.large a {
    width: 232px;
    height: 64px;
    line-height: 62px;
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

.modify-table .no-border-table tr.modify-address td input[type='text']:first-of-type {
    margin-bottom: 8px;
}

.modify-table .no-border-table td input[type="text"], .modify-table .no-border-table td input[type="password"] {
    width: 496px;
}
</style>
</head>
<body>

<header id="header"></header>

<section id="mypage-member" class="my-page" style="padding-top: 128px;">
	<div class="inner flex top">
		<!-- 사이드 -->
		<!-- 사이드 -->
		<jsp:include page="/managerpage/managerLeft.jsp"></jsp:include>
		<!-- 가운데 -->
		<article class="my-contents modify">
			<div class="mypage-top">
				<h2 class="mypage-title">회원상세정보</h2>
			</div>
			<div class="modify-table">
			<form id="user" action="/mypage/user-modify-sns" method="post">
				<div class="table-wrap">
					<p class="require-notice"></p>
					<table class="no-border-table">
						<input id="userId" name="userId" type="hidden" value="726198">
						<colgroup>
							<col width="123px">
							<col width="auto">
						</colgroup>
						<tbody>
						<c:forEach var="goods" items="${goods}">
						<tr>
							<th>번호</th>
							<td>
								<input id="userName" name="userName" disabled="disabled" type="text" value="${goods.pd_id}">	
							</td>
						</tr>
						<tr>
							<th>상품명</th>
							<td><input type="text" id="userNickName" name="userNickName" disabled="disabled" value="${goods.pd_name}" ></td>
						</tr>
						<tr>
							<th>용량</th>
							<td><input type="text"  readonly="" value="${goods.ps_amount}"></td>
						</tr>
						<tr>
							<th>수량</th>
							<td><input id="phoneNumber" name="phoneNumber" readonly="readonly" type="text" value="${goods.ps_weight}" ></td>
						</tr>
						<tr class="modify-address">
							<th>가격</th>
							<td>
							<input type="text" name="address" id="address" disabled="disabled" value="${goods.ps_price}">
							</td>
						</tr>
					</c:forEach>
						</tbody>
					</table>
					<p class="require-notice">* 회원 정보 변경시 로그아웃 이후 정상적으로 반영됩니다.</p>
					<hr style="border:solid 40px white;">
					<div class="btn-wrap large double">
						<button type="button" class="black-btn" id="saveBtn" onclick="location.href='/Lush/managerpage/managergoods.do'">목록</button>
					</div>
				</div>
			
				
				<div>
<input type="hidden" name="_csrf" value="eb4591af-1b0f-400f-a3f2-71d81fd2c752">
</div>
</form>
</div>
</article>
</div>
</section>

<footer id="footer"></footer>
</body>
</html>