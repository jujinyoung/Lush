<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>러쉬코리아</title>
<link href="css/style.css" type="text/css" rel="stylesheet">
<link href="css/layout.css" type="text/css" rel="stylesheet">
<!--  <link href="css/reset.css" type="text/css" rel="stylesheet"> -->
<link rel="shortcut icon" type="image/x-icon" href="">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>

</style>
</head>
<body>
	<article class="my-contents inquiry">
		<div class="mypage-top">
			<h2 class="mypage-title">1:1 문의</h2>
		</div>
		<div class="inquiry-top">
			<ul class="flex left period">
				<li><label for="searchStartDate">기간별 조회</label> 
				<input id="searchStartDate" name="searchStartDate"
					class="datepicker term calendar _number" title="주문일자 시작일"
					type="text" value="20221212" maxlength="8" autocomplete="off" />
					<span>~</span>
				<input id="searchEndDate" name="searchEndDate"
					class="datepicker2 term calendar _number" title="주문일자 종료일"
					type="text" value="20221219" maxlength="8" autocomplete="off" />
					</li>
				<li><input type="radio" id="d01" class="date_search week-1"
					value="week-1" name="during" checked><label for="d01">1주일</label>
					<input type="radio" id="d02" class="date_search month-1"
					value="month-1" name="during"><label for="d02">1개월</label>
					<input type="radio" id="d03" class="date_search month-3"
					value="month-3" name="during"><label for="d03">3개월</label>
					<input type="radio" id="d04" class="date_search month-6"
					value="month-6" name="during"><label for="d04">6개월</label>
				</li>
			</ul>
			<div class="btn-wrap medium right">
				<button type="button" class="border-btn" id="resetBtn" name="">초기화</button>
				<button type="submit" class="black-btn" id="" name="">검색</button>
			</div>
		</div>
		<div class="inq-contents">
			<div class="inq-table-top">
				<strong class="inq-notice">궁금한 사항을 남겨주시면, 운영시간(평일) 내에 최대한
					빠르게 확인하여 답변드리겠습니다.</strong>

				<p class="body1">
					고객센터 : 상담전화(1644-2357) 13:00~16:00,
					상담톡/1:1문의게시판/메일(webmaster@lush.co.kr) 10:00~16:00<br /> * 고객 여러분께
					보다 최적의 서비스를 드리기 위하여, '상담톡'을 운영하고 있습니다. (화면 오른쪽 아래 아이콘)<br /> *
					'상담톡' 문의 후 '상담원 연결'을 유지해 두시면 편리한 상담이 가능합니다.
				</p>
				<a href="/mypage/inquiry_write.do"
					class="black-btn medium-btn write-btn">1:1 문의하기</a>
			</div>
			<table class="list-table">
				<colgroup>
					<col width="130px">
					<col width="160px">
					<col width="auto">
					<col width="130px">
				</colgroup>
				<thead>
					<tr>
						<th>문의날짜</th>
						<th>카테고리</th>
						<th>제목</th>
						<th>문의상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td>${ dto.q_date }</td>
						<td>${ dto.q_category }</td>
						<td><a href="/mypage/inquiry-read/${ dto.q_qid }">${dto.q_title}</a></td>
						<td><span class="icon_answer answer_end">${ dto.q_status }</span></td>
					</tr>
				</tbody>
			</table>

			<div class="paginate">
				<ul>
					<li><a href="javascript:;" class="num on">1</a></li>
			</div>
		</div>
	</article>

	<script>
</script>
</body>
</html>