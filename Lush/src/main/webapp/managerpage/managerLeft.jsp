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
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&display=swap');

.inner {
    display: block;
    position: relative;
    margin: 0 auto;
    width: 1224px;
}

.flex {
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.flex.top {
    align-items: flex-start;
}

.flex.center {
    justify-content: center;
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

body, form, div, p, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, ol, li, fieldset, th, td, input, textarea, button, select {
    margin: 0;
    padding: 0;
    font-family: "Noto Sans KR",dotum,'돋움';
    color: #222;
}

body {
    font-size: 16px;
    font-family: 'Noto Sans KR';
    color: #222;
    font-weight: 400;
}

.body1 {
    font-size: 16px;
    line-height: 24px;
}

.body2 {
    font-size: 14px;
    line-height: 20px;
}

element.style {
    padding-top: 128px;
}

a {
    text-decoration: none;
    color: #222;
}

a:hover, a:focus, a:visited, a:active {
    text-decoration: none;
}

ol, ul, dl {
    list-style: none;
}

li {
    list-style: none;
}

fieldset, img {
    border: 0;
}

img {
    border: 0;
    vertical-align: middle;
}

.subtitle {
    font-size: 18px;
    line-height: 26px;
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

.my-page {
    margin-top: 64px;
}

.my-page .my-menu {
    display: block;
}

.my-page .my-menu h2 {
    margin-bottom: 48px;
    font-size: 32px;
    line-height: 42px;
}

.my-page .my-menu .menu-box {
    display: block;
    margin-bottom: 24px;
}

.my-page .my-menu .menu-box p {
    font-weight: 700;
}

.my-page .my-menu .menu-box ul li {
    display: block;
    padding-left: 12px;
    margin-top: 2px;
}

.my-page .my-menu .menu-box ul li a {
    font-size: 14px;
    color: #535353;
}

.my-page .my-contents {
    display: block;
    position: relative;
    width: 1016px;
    height: auto;
}

.user-box {
    padding: 40px 0;
    background: #fafafa;
}

.user-box .user-info {
    width: 360px;
}

.user-box .user-info .user-name {
    margin-bottom: 8px;
    font-size: 24px;
    line-height: 34px;
    font-weight: 700;
}

.user-box .user-info img {
    display: block;
    width: 72px;
    margin-right: 32px;
}

.user-box .user-info a {
    display: inline-block;
    line-height: 18px;
    color: #535353;
    border-bottom: 1px solid #535353;
    margin-top: 4px;
}

.user-box .user-menu {
    width: calc(100% - 360px);
}

.user-box .user-menu ul li {
    position: relative;
    width: 33.33%;
    text-align: center;
    padding: 15px 0;
}

.user-box .user-menu ul li::before {
    content: '';
    display: block;
    position: absolute;
    left: 0;
    top: 0;
    width: 1px;
    height: 100%;
    background: #eee;
}

.user-box .user-menu ul li p {
    display: inline-block;
    padding-left: 26px;
}

.user-box .user-menu ul li.benefit p {
    background: url(/images/mypage/ico_gift.svg) no-repeat center left;
}

.user-box .user-menu ul li a {
    display: block;
    font-size: 24px;
    color: #222;
    font-weight: 700;
    margin-top: 6px;
}

.user-box .user-menu ul li a span {
    display: inline-block;
    border-bottom: 1px solid #222;
    line-height: 1.15em;
}

.user-box .user-menu ul li.duczzi p {
    background: url(/images/mypage/ico_duczzi.svg) no-repeat center left;
}

.user-box .user-menu ul li.question p {
    background: url(/images/mypage/ico_question.svg) no-repeat center left;
}

.order-ing {
    margin-top: 56px;
}

.my-contents .sub-page-title {
    font-size: 24px;
    line-height: 34px;
    font-weight: 700;
    margin-bottom: 12px;
    color: #222;
}

.my-contents .sub-page-title span {
    display: inline-block;
    font-size: 14px;
    color: #757575;
    font-weight: 400;
    line-height: 34px;
    margin-left: 24px;
}

.order-ing > ul {
    padding: 16px 0;
    border-top: 2px solid #222;
    border-bottom: 1px solid #eee;
}

.order-ing > ul > li {
    display: block;
    position: relative;
    text-align: center;
    width: calc((100% - 152px)/6);
}

.order-ing > ul > li p {
    color: #757575;
}

.order-ing > ul > li a {
    display: inline-block;
    font-size: 24px;
    font-weight: 700;
    border-bottom: 1px solid #222;
    line-height: 1.15em;
    margin-top: 8px;
}

.order-ing > ul > li a.on {
    color: #18a957;
    border-bottom: 1px solid #18a957;
}

.order-ing > ul > li:last-of-type ul li a {
    margin-top: 0;
    font-size: 16px;
}

.order-ing > ul > li::after {
    content: '';
    display: block;
    width: 6px;
    height: 12px;
    position: absolute;
    right: -3px;
    top: 8px;
    background: url(/images/mypage/arrow_next_6x12.svg) no-repeat center center;
}

.order-ing > ul > li:last-of-type ul li {
    display: block;
    color: #757575;
    margin-bottom: 2px;
}

.order-ing > ul > li:last-of-type ul li span {
    display: inline-block;
    width: 54px;
    text-align: left;
}

.order-ing > ul > li:last-of-type ul li a {
    margin-top: 0;
    font-size: 16px;
}

.order-recently {
    margin-top: 56px;
}





.order-recently .table-wrap {
    margin-top: 32px;
}

.order-recently .table-wrap .table-top {
    display: flex;
    justify-content: flex-start;
    align-items: center;
}

.order-recently .table-wrap .table-top p:not(:first-of-type) {
    margin-left: 24px;
}

.order-recently .table-wrap .table-top p a {
    color: #18a957;
}

.order-recently .table-wrap .table-top .link {
    position: absolute;
    right: 0;
    border-bottom: 1px solid #535353;
    color: #535353;
    line-height: 1.15em;
}

table {
    border-collapse: collapse;
    border-spacing: 0;
    width: 100%;
    table-layout: fixed;
}

table.thumb-table {
    border-top: 1px solid #bdbdbd;
}

table.border {
    border-top: 2px solid #222;
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

table.thumb-table thead th:nth-of-type(2) {
    padding-left: 24px;
}

.order-recently .table-wrap table td {
    text-align: center;
}

.order-recently .table-wrap table td .cate {
    display: block;
    margin-top: 8px;
    font-size: 14px;
    color: #757575;
}

table.thumb-table tbody tr td {
    border-bottom: 1px solid #eee;
    font-size: 16px;
    padding: 16px 0;
    color: #757575;
    vertical-align: middle;
    text-align: center;
}

table.thumb-table tbody tr td a {
    color: #222;
}

table.thumb-table tbody tr td:first-of-type img {
    display: block;
    width: 100%;
    background: #f6f6f6;
    max-width: 100px;
}

.order-recently .table-wrap table th:nth-of-type(2) {
    text-align: left;
}

.order-recently .table-wrap table td:nth-of-type(2) {
    padding: 16px 24px;
    text-align: left;
}

.order-recently .table-wrap table td.complete {
    color: #18a957;
}

table tbody tr.btn-set:last-of-type td {
    border-bottom: none;
}

.order-recently .table-wrap table td {
    text-align: center;
}

.border-btn {
    position: relative;
    border: 1px solid #222;
    background: #fff;
    color: #222;
    text-align: center;
}

.btn-wrap {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
}

.btn-wrap.right {
    justify-content: flex-end;
}

.btn-wrap.xsmall button, .btn-wrap.xsmall a {
    width: 96px;
    height: 42px;
    line-height: 40px;
    font-size: 14px;
}

table .right {
    text-align: right !important;
}

.prd-recently {
    margin-top: 56px;
}

.prd-recently ul {
    margin-top: 16px;
    flex-wrap: wrap;
    align-items: flex-start;
    justify-content: flex-start;
}

.prd-recently ul li {
    width: 195px;
    position: relative;
    margin-right: 10px;
}

.prd-recently ul li .prd-image {
    display: block;
    width: 100%;
    height: 195px;
    position: relative;
    overflow: hidden;
}

.prd-recently ul li .prd-image img {
    display: block;
    position: relative;
    left: 50%;
    top: 50%;
    transform: translate(-50%, -50%);
    height: 100%;
    width: auto;
}

.prd-recently ul li .buttons {
    display: block;
    position: relative;
    margin-top: -15px;
}

.prd-recently ul li .buttons button {
    margin-right: 10px;
}

.prd-recently ul li .prd-name {
    display: block;
    font-weight: 700;
    margin: 10px 0 0;
}

.prd-recently ul li .hashBox a {
    display: inline-block;
    color: #535353;
}

.prd-recently ul li .prd-price {
    display: block;
    margin-top: 6px;
    letter-spacing: -0.45px;
    color: #535353;
}

.prd-recently ul li .del-btn {
    position: absolute;
    top: 19px;
    right: 16px;
    width: 24px;
    height: 24px;
    display: block;
    z-index: 2;
}

.dimmed {
    position: fixed;
    display: none;
    left: 0;
    top: 0;
    width: 100vw;
    height: 100vh;
    background: rgba(34, 34, 34, 0.4);
    z-index: 12;
}
</style>
</head>
<body>
	<!-- 마이페이지 좌측 메뉴 -->
	<article class="my-menu">
		<h2>
			<a href="/Lush/managerpage/managerMain.jsp" class="on">관리페이지</a>
		</h2>

		<div class="menu-box">
			<p class="body2">회원관리</p>
			<ul>
				<li><a href="/Lush/managerpage/memberman.do">회원정보 관리</a></li>
			</ul>
		</div>
		<hr style="border:solid 1px white;">
		<div class="menu-box">
			<p class="body2">제품관리</p>
			<ul>
				<li><a href="/Lush/managerpage/managergoods.do">제품상태 관리</a></li>
				<li><a href="/Lush/managerpage/goodsAdd.jsp">제품 등록</a></li>
			</ul>
		</div>
		<hr style="border:solid 1px white;">
		<div class="menu-box">
			<p class="body2">주문관리</p>
			<ul>
				<li><a href="/Lush/managerpage/managerOrder.do">주문상태 관리</a></li>
			</ul>
		</div>
		<hr style="border:solid 1px white;">
		<div class="menu-box">
			<p class="body2">공지사항관리</p>
			<ul>
				<li><a href="/Lush/managerpage/managerNotice.jsp">공지사항 관리</a></li>
				<li><a href="/Lush/managerpage/noticeAdd.jsp">공지사항 등록</a></li>
			</ul>
		</div>
		<hr style="border:solid 1px white;">
		<div class="menu-box">
			<p class="body2">이벤트 관리</p>
			<ul>
				<li><a href="/Lush/managerpage/eventAdd.jsp">이벤트 등록</a></li>
			</ul>
		</div>
	</article>
	
	
</body>
</html>