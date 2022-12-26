<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2022. 12. 26. 오후 5:15:06</title>
<link rel="stylesheet" href="mypageOrder.css" type="text/css">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
</style>
</head>
<body>

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
			<form id="orderSearchParam" name="orderSearchParam"
				action="/mypage/order/1" method="get">
				<input type="hidden" name="statusType" id="statusType" value="">
				<input type="hidden" name="deliveryType" id="deliveryType" value="">
				<div class="opt-box-wrap">
					<ul class="flex left period">
						<li><label for="searchStartDate">기간별 조회</label> <input
							id="searchStartDate" name="searchStartDate" title="주문일자 시작일"
							class="datepicker term calendar hasDatepicker" type="text"
							value="20220927" maxlength="8" autocomplete="off"><span>~</span>
							<input id="searchEndDate" name="searchEndDate" title="주문일자 종료일"
							class="datepicker2 term calendar hasDatepicker" type="text"
							value="20221226" maxlength="8" autocomplete="off"></li>
						<li><input type="radio" id="d01" class="date_search week-1"
							value="week-1" name="during"><label for="d01">1주일</label>
							<input type="radio" id="d02" class="date_search month-1"
							value="month-1" name="during"><label for="d02">1개월</label>
							<input type="radio" id="d03" class="date_search month-3"
							value="month-3" name="during" checked=""><label for="d03">3개월</label>
							<input type="radio" id="d04" class="date_search month-6"
							value="month-6" name="during"><label for="d04">6개월</label>
						</li>
					</ul>
					<ul class="flex left">
						<li><label for="prd-type">제품 유형</label>
							<div class="select-box" id="selProdBox">
								<a href="javascript:;" id="prdType" class="selected-value">선택해주세요</a>
								<ul class="option-box" id="prd-type">
									<li data-prd-type="">선택해주세요</li>
									<li data-prd-type="1">일반배송</li>
									<li data-prd-type="2">정기배송</li>
									<li data-prd-type="4">구독박스</li>
									<li data-prd-type="3">선물하기</li>
								</ul>
							</div></li>
						<li><label for="delivery">배송상태</label>
							<div class="select-box" id="selDelBox">
								<a href="javascript:;" class="selected-value">선택해주세요</a>
								<ul class="option-box" id="delivery">
									<li data-delivery="">선택해주세요</li>
									<li data-delivery="waiting-deposit">입금대기</li>
									<li data-delivery="new-order">결제완료</li>
									<li data-delivery="shipping-ready">배송준비중</li>
									<li data-delivery="shipping-mypage">배송중</li>
									<li data-delivery="35">배송완료</li>
									<li data-delivery="confirm">구매확정</li>
									<li data-delivery="return-process">반품</li>
									<li data-delivery="exchange-process">교환</li>
									<li data-delivery="cancel-process">취소</li>
								</ul>
							</div></li>
						<li><label for="orderCode">주문번호</label> <input type="text"
							id="orderCode" name="orderCode" value=""></li>
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
			<div class="table-wrap">
				<div class="table-top">
					<p class="sub-page-title">일반배송</p>
					<p>
						<span>주문일 : 2022-12-26</span> / <span>주문번호 : <a
							href="/mypage/order-detail/0/K1000081643">K1000081643</a></span>
					</p>
					<a href="/mypage/order-detail/0/K1000081643" class="link">상세보기</a>
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
						<tr>
							<td><img src="/upload/item/65/20211008133548XS.png"
								alt="일반배송상품"></td>
							<td>
								<p class="name">오션 솔트 120g/250g</p>
								<p class="cate">페이스 앤 보디 스크럽</p>
								<ul class="option">
									<li><span class="choice">용량 : </span><span>120g</span></li>
								</ul>
								<p></p>
							</td>
							<td>￦ 28,000</td>
							<td>1개</td>
							<td class="complete">취소완료</td>
							<td>
								<div class="btn-wrap xsmall right">
									<a href="/mypage/order-detail/0/K1000081643/0"
										class="border-btn">내역보기</a>
								</div>
							</td>
						</tr>
						<tr class="btn-set">
							<td colspan="6">
								<div class="btn-wrap xsmall right"></div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="table-wrap">
				<div class="table-top">
					<p class="sub-page-title">일반배송</p>
					<p>
						<span>주문일 : 2022-12-20</span> / <span>주문번호 : <a
							href="/mypage/order-detail/0/K1000079212">K1000079212</a></span>
					</p>
					<a href="/mypage/order-detail/0/K1000079212" class="link">상세보기</a>
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
						<tr>
							<td><img src="/upload/item/1000001178/20221212162556XS.png"
								alt="일반배송상품"></td>
							<td>
								<p class="name">사쿠라</p>
								<p class="cate">보디 스프레이</p>
								<p></p>
							</td>
							<td>￦ 70,000</td>
							<td>1개</td>
							<td class="complete">취소완료</td>
							<td>
								<div class="btn-wrap xsmall right">
									<a href="/mypage/order-detail/0/K1000079212/0"
										class="border-btn">내역보기</a>
								</div>
							</td>
						</tr>
						<tr class="btn-set">
							<td colspan="6">
								<div class="btn-wrap xsmall right"></div>
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div class="paginate">
				<ul>
					<li><a href="javascript:;" class="num on">1</a></li>
				</ul>
			</div>
		</div>
	</article>
	</div>
	
	
</section>

<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>
	<script>

</script>
</body>
</html>