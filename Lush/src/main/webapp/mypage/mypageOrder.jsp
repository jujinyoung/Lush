<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="stylesheet" href="css/mypageOrder.css" type="text/css">
<!-- 날짜 선택 api -->
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />  
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>  
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>


<title>러쉬 MYPAGE ORDER</title>
<link rel="icon" type="image/png" sizes="192x192"
	href="/Lush/images/ico/fabicon.png">
</head>
<body>
	<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>

	<section id="mypage" class="my-page" style="padding-top: 128px;">
		<div class="inner flex top">
			<!-- 마이페이지 좌측 메뉴 -->
			<jsp:include page="/mypage/mypageLeft.jsp"></jsp:include>
			<!-- 마이페이지 좌측 메뉴 // -->

			<article class="my-contents ">
				<div class="mypage-top">
					<h2 class="mypage-title">주문/배송 조회</h2>
				</div>
				<div class="od-top">
					<form action="/Lush/mypage/mypagesearch.do" method="get">
						<div class="opt-box-wrap">
							<ul class="flex left period">
								<li><label for="searchStartDate">기간별 조회</label> <input
									id="searchStartDate" name="searchStartDate" title="주문일자 시작일"
									 type="text"
									value="" maxlength="8" autocomplete="off"><span>~</span>
									<input id="searchEndDate" name="searchEndDate" title="주문일자 종료일"
									 type="text"
									value="" maxlength="8" autocomplete="off"></li>
								
							</ul>
							<ul class="flex left">
								
								<li><label for="delivery">배송상태</label>
									<select id="os">
													<option value="1">입금대기</option>
													<option value="2">결제완료</option>
													<option value="3">배송준비</option>
													<option value="4">배송중</option>
													<option value="5">배송완료</option>
													<option value="6">구매확정</option>
													<option value="7">주문취소</option>
													<option value="8">교환</option>
													<option value="9">반품</option>
									</select> <input type="hidden" id="oss" name="oss"
													value="">

								<li><label for="orderCode">주문번호</label> <input type="text"
									id="oid" name="oid" value=""></li>
							</ul>
						</div>
						<div class="btn-wrap small right">
							<button type="button" id="resetBtn" class="border-btn">초기화</button>
							<button type="submit" class="black-btn">검색</button>
						</div>
						<div>
							<input type="hidden" name="_csrf"
								value="6ad0ba6a-1522-4b62-a3b2-132f1e0690d8">
						</div>
					</form>
				</div>
				<div class="od-contents">
					<c:forEach var="map" items="${maps}"> 

					<div class="table-wrap">

						<div class="table-top">
							<p class="sub-page-title">일반배송</p>
							<p>
								<span>주문일 : ${map.value.get(0).getOdate()}</span> / <span>주문번호 : <a
									href="/mypage/order-detail/0/K1000079212">KFBGKD-${map.key}</a></span>
							</p>
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
							<thead>
								<tr>
									<th></th>
									<th>상품 정보</th>
									<th>가격</th>
									<th>수량</th>
									<th>상태</th>
									<th>관리</th>
								</tr>
							</thead>
							
							<tbody>
								<c:forEach var="pro" items="${map.value}"> 
								<tr>
									<td><img src="../images/products/${pro.pid}.png" alt="일반배송상품"></td>
									<td>
										<p class="name">${pro.name}</p>
										<p class="cate">${pro.cat3}</p>
										<p class="cate"></p>
									</td>
									<td>￦ ${pro.price}</td>
									<td>${pro.amount}개</td>
									<td class="complete">${pro.os_name}</td>
									<td>
										<div class="btn-wrap xsmall right">
											<a href="/mypage/order-detail/0/K1000079212/0"
												class="border-btn">취소하기</a>
										</div>
									</td>
								</tr>
								<tr class="btn-set">
									<td colspan="6">
										<div class="btn-wrap xsmall right"></div>
									</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					</c:forEach>
					<div class="paginate">

					</div>
				</div>
			</article>
		</div>


	</section>

	<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>

</body>

<script type="text/javascript">
$(document).ready(function () {
        $.datepicker.setDefaults($.datepicker.regional['ko']); 
        $( "#searchStartDate" ).datepicker({
             changeMonth: true, 
             changeYear: true,
             nextText: '다음 달',
             prevText: '이전 달', 
             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             dateFormat: "yymmdd",
             maxDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
             onClose: function( selectedDate ) {    
                  //시작일(startDate) datepicker가 닫힐때
                  //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                 $("#searchEndDate").datepicker( "option", "minDate", selectedDate );
             }    

        });
        $( "#searchEndDate" ).datepicker({
             changeMonth: true, 
             changeYear: true,
             nextText: '다음 달',
             prevText: '이전 달', 
             dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
             dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'], 
             monthNamesShort: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'],
             dateFormat: "yymmdd",
             maxDate: 0,                       // 선택할수있는 최대날짜, ( 0 : 오늘 이후 날짜 선택 불가)
             onClose: function( selectedDate ) {    
                 // 종료일(endDate) datepicker가 닫힐때
                 // 시작일(startDate)의 선택할수있는 최대 날짜(maxDate)를 선택한 시작일로 지정
                 $("#searchStartDate").datepicker( "option", "maxDate", selectedDate );
             }    

        });    
});

</script>
<script>
$("#oid").val("0");
$("#oss").val("1");

$("#os").change(function(){
	var valss = $("#os option:selected").val();
	$("#oss").val(valss);
}); 
</script>

<script>
var today = new Date();

var year = today.getFullYear();
var month = ('0' + (today.getMonth() + 1)).slice(-2);
var day = ('0' + today.getDate()).slice(-2);

var dateString = year + month + day;

$("#searchStartDate").val(dateString);
$("#searchEndDate").val(dateString);

$("#resetBtn").click(function(){
	$("#searchStartDate").val(dateString);
	$("#searchEndDate").val(dateString);
	$("#os").val("0");
	$("#oid").val("");
}); 
</script>
</html>