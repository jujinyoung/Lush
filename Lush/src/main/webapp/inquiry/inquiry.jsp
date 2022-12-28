<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>러쉬코리아</title>
<link rel="icon" type="image/png" sizes="192x192" href="../images/ico/fabicon.png">
<link href="css/reset.css" type="text/css" rel="stylesheet">
<link href="css/layout.css" type="text/css" rel="stylesheet">
<link href="css/style.css" type="text/css" rel="stylesheet">

<link rel="shortcut icon" type="image/x-icon" href="">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

  <link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
  <link rel="stylesheet" href="/resources/demos/style.css">
  <script src="https://code.jquery.com/jquery-3.6.0.js"></script>
  <script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>



  
<style>

</style>
</head>
<body>
 <form id="searchParam" action="" method="get">
<section id="mypage-inquiry" class="my-page">
	<div class="inner flex top">
		<!-- 마이페이지 좌측 메뉴 -->
		<article class="my-menu">
    <h2><a href="/mypage/index">마이페이지</a></h2>

    <div class="menu-box">
        <p class="body2">쇼핑정보</p>
        <ul>
            <li><a href="/mypage/order/1">주문/배송 조회</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <p class="body2">제품관리</p>
        <ul>
            <li><a href="/mypage/wishlist">찜 목록</a></li>
            <li><a href="/mypage/regular">정기배송 관리</a></li>
            <li><a href="/mypage/subscription">구독박스 관리</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <p class="body2">내 덕찌</p>
        <ul>
            <li><a href="/mypage/badge/2022">2022</a></li>
            <li><a href="/mypage/badge/2021">2021</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <p class="body2">스파</p>
        <ul>
            <li><a href="/mypage/order/2">스파 주문내역</a></li>
            <li><a href="/mypage/spaArrange">스파 예약현황</a></li>
            <li><a href="/mypage/spaManual">스파 이용안내</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <p class="body2">혜택관리</p>
        <ul>
            <li><a href="/mypage/benefit">혜택선물</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <p class="body2">고객센터</p>
        <ul>
            <li><a href="/mypage/noticeList">공지사항</a></li>
            <li><a href="/Lush/inquiry/list.do">1:1문의</a></li>
            <li><a href="/mypage/compliment">칭찬게시판</a></li>
            <li><a href="/mypage/faq">FAQ</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <p class="body2">회원정보</p>
        <ul>
            <li><a href="/mypage/user-modify">회원정보 변경</a></li>
            <li><a href="/mypage/user-leave">회원 탈퇴</a></li>
            <li><a href="/mypage/user-delivery">배송지 관리</a></li>
        </ul>
    </div>

    <div class="menu-box">
        <a href="/mypage/plus-review" class="body2"><strong>나의 플러스 리뷰</strong></a>
    </div>
</article>


<!-- 마이페이지 좌측 메뉴 //-->

		<!-- 마이페이지 우측 컨텐츠 영역 -->
		<article class="my-contents inquiry">
			<div class="mypage-top">
				<h2 class="mypage-title">1:1 문의</h2>
			</div>
			<div class="inquiry-top">
				<ul class="flex left period">
					<li>
						<label for="searchStartDate">기간별 조회</label>
						<input id="searchStartDate" name="searchStartDate" class="datepicker term calendar _number" title="주문일자 시작일" type="text" value="20221220" maxlength="8" autocomplete="off"/><span>~</span>
						<input id="searchEndDate" name="searchEndDate" class="datepicker2 term calendar _number" title="주문일자 종료일" type="text" value="20221227" maxlength="8" autocomplete="off"/></li>
					<li>
						<input type="radio" id="d01" class="date_search week-1" value="week-1" name="during" checked><label for="d01">1주일</label>
						<input type="radio" id="d02" class="date_search month-1" value="month-1" name="during" ><label for="d02">1개월</label>
						<input type="radio" id="d03" class="date_search month-3" value="month-3" name="during" ><label for="d03">3개월</label>
						<input type="radio" id="d04" class="date_search month-6" value="month-6" name="during" ><label for="d04">6개월</label>
					</li>
				</ul>
				<div class="btn-wrap medium right">
					<button type="button" class="border-btn" id="resetBtn" name="">초기화</button>
					<button type="submit" class="black-btn" id="" name="">검색</button>
				</div>
			</div>
			<div class="inq-contents">
				<div class="inq-table-top">
					<strong class="inq-notice">궁금한 사항을 남겨주시면, 운영시간(평일) 내에 최대한 빠르게 확인하여 답변드리겠습니다.</strong>

					<p class="body1">
						고객센터 : 상담전화(1644-2357) 13:00~16:00, 상담톡/1:1문의게시판/메일(webmaster@lush.co.kr) 10:00~16:00<br/>
						* 고객 여러분께 보다 최적의 서비스를 드리기 위하여, '상담톡'을 운영하고 있습니다. (화면 오른쪽 아래 아이콘)<br/>
						* '상담톡' 문의 후 '상담원 연결'을 유지해 두시면 편리한 상담이 가능합니다.
					</p>
					<a href="/Lush/inquiry/write.do" class="black-btn medium-btn write-btn">1:1 문의하기</a>
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
							<c:choose>
								<c:when test="${ not empty inquirys }">

									<c:forEach items="${ inquirys }" var="dto">
										<tr>
											<td>${ dto.q_date }</td>
											<td>
											<c:choose>
											<c:when test="${ dto.q_category eq 1}">상품</c:when>
											<c:when test="${ dto.q_category eq 2}">주문/결제</c:when>
											<c:when test="${ dto.q_category eq 3}">오프라인</c:when>
											<c:when test="${ dto.q_category eq 4}">배송</c:when>
											<c:when test="${ dto.q_category eq 5}">배송지연</c:when>
											<c:when test="${ dto.q_category eq 6}">교환/취소/반품</c:when>
											<c:when test="${ dto.q_category eq 7}">회원정보</c:when>
											<c:otherwise>기타</c:otherwise>
											</c:choose>
											</td>
											<td><a href="/Lush/inquiry/view.do?q_qid=${dto.q_qid}">${dto.q_title}</a></td>
											<td>${ dto.q_status }</td>
										</tr>
									</c:forEach>

								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="4">확인되는 게시글이 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>

					<div class="paginate">
	<ul>

							<li><a href="javascript:;" class="num on">1</a></li>
</ul>
</div></div>
		</article>
	</div>
</section>
</form>

<!-- 기간별 조회 -->
<script type="text/javascript">

		$(function() {
			$("#searchEndDate").datepicker({dateFormat: "yy-mm-dd"});

			//시작일.
			$('#searchStartDate').datepicker({
				dateFormat: "yy-mm-dd",
				onClose: function( selectedDate ) {
					// 시작일(fromDate) datepicker가 닫힐때
					// 종료일(toDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
					if ($("#searchStartDate").val().trim()) {
						$("#searchEndDate").datepicker( "option", "minDate", selectedDate.substring(0,4)+"-"+selectedDate.substring(4,6)+"-"+selectedDate.substring(6,8) );
					}
				}
			});

			$('[name="during"]').on('change', function(){
				const dValue = $("input[name='during']:checked").val()
				let mode = dValue.split("-")[0];
				let v = dValue.split("-")[1];
				setTerm(mode, v, '');
			});

			$('#searchStartDate,  #searchEndDate').on('change', function(){
				let date = $(this).val();
				var str = date.replace(/-/gi, "");
				$(this).val(str);
			});

			$('#resetBtn').on("click",function(){
				// $("#searchStartDate").val("");
				// $("#searchEndDate").val("");
				var resetStart = new Date();
				var resetEnd = new Date();
				resetStart.setDate(resetEnd.getDate() - 7);
				var startMonth = resetStart.getMonth() + 1;
				var startDate  = resetStart.getDate();
				var endMonth = resetEnd.getMonth() + 1;
				var endDate  = resetEnd.getDate();

				startMonth = startMonth >= 10 ? startMonth : "0" + startMonth;
				startDate  = startDate  >= 10 ? startDate : "0" + startDate;
				endMonth = endMonth >= 10 ? endMonth : "0" + endMonth;
				endDate  = endDate >= 10 ? endDate : "0" + endDate;

				$("#searchStartDate").val(resetStart.getFullYear() + startMonth + startDate + '');
				$("#searchEndDate").val(resetEnd.getFullYear() + endMonth + endDate + '');

				$("input[name=during]").prop('checked', false);
				$("input[name=during][id=d01]").prop('checked', true);
			});
		});

		function setTerm(mode, value, character){

			var date = new Date();
			var toDate = new Date();
			if (mode == 'week') {
				date.setDate(date.getDate() - (value * 7));
			} else if (mode == 'day') {
				date.setDate(date.getDate() - value);
			} else if (mode == 'month') {
				date.setMonth(date.getMonth() - value);
			} else if (mode == 'year') {
				date.setFullYear(date.getFullYear() - value);
			}
			var sDate = date.getFullYear() + character + Common.addZero((date.getMonth() + 1), 2) + character + Common.addZero(date.getDate(), 2)
			var eDate = toDate.getFullYear() + character + Common.addZero((toDate.getMonth() + 1), 2) + character + Common.addZero(toDate.getDate(), 2)
			$("#searchStartDate").val(sDate);
			$("#searchEndDate").val(eDate);
		}
	</script>
	
	
</body>
</html>