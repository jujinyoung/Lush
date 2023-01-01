<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>제품 등록</title>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
<link rel="stylesheet"   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script   src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<style>
/* 전체 */
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@500&display=swap');

body, form, div, p, h1, h2, h3, h4, h5, h6, dl, dt, dd, ul, ol, li, fieldset, th, td, input, textarea, button, select {
    margin: 0;
    padding: 0;
    font-family: "Noto Sans KR", sans-serif;
    color: #222;
}

* {
    box-sizing: border-box !important;
}

* {
    -webkit-text-size-adjust: none;
    text-shadow: none !important;
}

form {
    display: block;
    margin-top: 0em;
}

body {
    font-size: 16px;
    font-family: 'NotoSans';
    color: #222;
    font-weight: 400;
}

element.style {
    padding-top: 128px;
}

.my-page {
    margin-top: 64px;
}

section {
    min-height: calc(100vh - 96px - 320px);
}

section {
    display: block;
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

/* 탑 */
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

table.border {
    border-top: 2px solid #222;
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

input[type="checkbox"] {
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

input {
    -webkit-border-radius: 0;
}

input {
    vertical-align: middle;
}

input, textarea, select {
    letter-spacing: normal;
}

.list-table tr.title td label {
    padding-left: 24px;
    margin-left: 6px;
}

input[type="checkbox"] + label {
    display: inline-block;
    position: relative;
    cursor: pointer;
    background: url(../images/ico/checkbox_off.svg) no-repeat center left;
    padding-left: 36px;
    color: #535353;
    min-width: 20px;
    min-height: 20px;
    background-size: 20px 20px;
}

label {
    cursor: default;
}

.list-table tr.title td label span {
    display: inline-block;
    padding-right: 24px;
    background: url(../images/ico/ico_lock.svg) no-repeat center right;
}

.list-table tr td {
    position: relative;
    padding: 16px 0;
}

table.list-table tr td {
    border-bottom: 1px solid #eee;
    font-size: 16px;
    line-height: 24px;
    padding-top: 19px;
    padding-bottom: 20px;
    color: #757575;
}

.plus-review-table table tr th {
    font-weight: 400;
}

.list-table tr th {
    text-align: left;
    vertical-align: middle;
    padding-left: 50px;
}

.list-table tr.contents td textarea {
    width: 496px;
    height: 240px;
    font-size: 16px;
}

textarea {
    -webkit-appearance: none;
    border: 1px solid #949494;
    padding: 10px 10px;
    background: #fff;
    resize: none;
    overflow-y: auto;
    font-size: 16px;
}

.files .upload-box {
    display: flex;
}

.file-notice {
    font-size: 14px;
    color: #535353;
}

p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
}

.btn-wrap {
    padding-top: 32px;
    padding-bottom: 40px;
}

.btn-wrap {
    display: flex;
    justify-content: center;
    align-items: center;
    flex-wrap: wrap;
}

.btn-wrap.double > button:first-child, .btn-wrap.double > a:first-child {
    margin-right: 16px;
}

.btn-wrap.large button, .btn-wrap.large a {
    width: 232px;
    height: 64px;
    line-height: 62px;
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

.border-btn {
    position: relative;
    border: 1px solid #222;
    background: #fff;
    color: #222;
    text-align: center;
}

.black-btn {
    position: relative;
    background: #222;
    color: #fff !important;
    text-align: center;
    border: 1px solid #222;
}

form input::file-selector-button {
        display: none;
      }
      
select {
width: 200px; 
padding: .8em .5em; 
border: 1px solid #999;
font-family: inherit;  
background: url('arrow.jpg') no-repeat 95% 50%; 
border-radius: 0px; 
-webkit-appearance: none; 
-moz-appearance: none;
appearance: none;
}

select::-ms-expand {
    display: none;
}
</style>


</head>
<body>

<header></header>
<form id="reviewList" action="/mypage/plus-review" method="post">
	<section id="mypage-plus" class="my-page" style="padding-top: 128px;">
		<div class="inner flex top">
			
			<!-- 마이페이지 좌측 메뉴 //-->
			<jsp:include page="/managerpage/managerLeft.jsp"></jsp:include>

			<!-- 마이페이지 우측 컨텐츠 영역 -->
			<article class="my-contents plus">
				<div class="mypage-top">
					<h2 class="mypage-title">제품 등록</h2>
				</div>
				<div class="plus-review-table">
				
				<table class="list-table light">
                <colgroup>
                    <col width="210px">
                    <col width="auto">
                </colgroup>
                
                <tbody>
                
                <tr class="title">
                    <th>카테고리</th>
                    <td>
                        <select>
                        	<option selected>&nbsp;카테고리</option>
                        	<option>1</option>
                        	<option>2</option>
                        	<option>3</option>
                        </select>
                    </td>
                </tr>
               
                <tr class="contents">
                    <th>제품 소개</th>
                    <td>
                        <textarea name="cmntContent" class="_emoji2"></textarea>
                    </td>
                </tr>
                
                <tr class="files">
                    <th>제품 이미지</th>
                    <td>
                        <div class="upload-box">
                            <ul class="file-tree">
                            </ul>
                            <label for="boardCommentFiles" class="file-btn"><span>파일선택</span></label>&nbsp;
                            <input type="file" id="boardCommentFiles" hidden="" multiple="multiple">
                        </div>
                        <p class="file-notice">2MB이하 이미지파일(png, jpg)로 최대 2개까지 업로드 가능합니다.</p>
                    </td>
                </tr>
                
                <tr class="files">
                    <th>제품 가격</th>
                    <td>
                        <div class="upload-box">
                            <ul class="file-tree">
                            </ul>
                            <input type="number" value="0" id="boardCommentFiles">
                        </div>
                    </td>
                </tr>
                
                <tr class="files">
                    <th>제품 수량</th>
                    <td>
                        <div class="upload-box">
                            <ul class="file-tree">
                            </ul>
                            <input type="number" value="0" id="boardCommentFiles">
                        </div>
                    </td>
                </tr>
                </tbody>
            </table>
            <div>
            <input type="hidden" name="_csrf" value="bef55ff9-f147-4f96-b725-12e0449c5554">
            </div>
				</div>
				
			<div class="btn-wrap large double">
        <button type="reset" class="border-btn pop-change" onclick="rna.openLayerPopup('commentCancelPopup')">취소</button>
        <button type="button" class="black-btn pop-change" onclick="registBoardComment();">작성하기</button>
    </div>
			</article>
		</div>
	</section>
</form>

<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>
</body>
</html>