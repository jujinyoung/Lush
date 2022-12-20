<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>러쉬 ORDER</title>
    <link rel="stylesheet" href="css/order_style.css" type="text/css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>
<header></header>
<section id="order" style="padding-top: 128px;">
	<form id="buy" name="buy" action="/order/pay" method="post">

		<!-- 회원 정보 -->
			<div class="order-wrap">
			<div class="inner">
				<div class="page-top">
					<h2 class="page-title">주문/결제</h2>
				</div>
				<article class="prd-info">
					<h3>제품 정보</h3>

					<table class="thumb-table">
						<colgroup>
							<col width="156px">
							<col width="auto">
							<col width="140px">
						<col width="320px">
							<col width="140px">
						</colgroup>
						<thead>
						<tr>
							<th></th>
							<th>제품정보</th>
							<th>수량</th>
							<th>금액</th>
						<th>합계 금액</th>
						</tr>
						</thead>
						<tbody>
						
<%-- <c:forEach var="event" items="${events}">
 --%><tr>
    <td class="cart-prd-img"><img src=https://www.lush.co.kr/upload/item/342/20220727192654M.png alt="dummy 제품 이미지"></td>
    <td class="text-left">
        <p class="subtitle" id="cartData-0" data-store-qt="1" data-store-id="342" data-store-nm="더 올리브 브랜치 100g/250g/500g/1000g" data-store-va="용량 : 250g (+17,000원)" data-store-am="34000">더 올리브 브랜치 100g/250g/500g/1000g</p><p class="cate body1">샤워 젤</p>
                <p class="option body2"></p><ul class="option"><li> <span class="choice">용량 : </span><span>250g</span> (+17,000원)</li></ul><p></p>
                </td>
    <td>
        <div class="quantity-box">
            <input type="text" class="quantity" id="quantity-0" value="1" readonly="">
        </div>
    </td>
<td id="itemSalePrice-0">￦34,000</td>
        <td id="itemSaleAmount-0">￦34,000</td>
</tr>
<%-- </c:forEach>
 --%>
</tbody>
						<tfoot class="cal">
						<tr>
							<td colspan="5">
								<ul class="total-wrap flex">
									<li><span>선택제품</span> <strong>1 개</strong></li>
<li><span>제품합계</span> <strong>￦ 34,000</strong></li>
										<li class="d-charge"><span>배송비</span> <strong class="op-total-delivery-charge-text">￦ 0</strong></li><li><span>주문금액</span> 	<strong class="op-order-pay-amount-text">￦ 34,000</strong></li>
								</ul>
							</td>
						</tr>
						</tfoot>
					</table>
				</article>
				
				<article class="service flex top">

								<div class="dukzzi">
										<h3>발급 덕찌 안내 <span>(덕찌는 구매확정 시 지급됩니다.)</span></h3>
										<img src="https://www.lush.co.kr/upload/badge/625/badgeImageOn/20221201102551L.png" class="dukzzi-image" alt="덕찌 이미지"> <span>12월 또담아찌</span><br><br>
										</div>
								<div class="gift">
									<h3>사은품 선택
										<span>(체크박스 미선택 시 사은품 적용이 불가합니다.)</span>
									</h3>
									<ul>
										<!-- 구매 사은품 -->
										<li>
													<input type="checkbox" id="g2_94" name="giftItemIds">
													<label for="g2_94">
														<img src="https://www.lush.co.kr/upload/gift-item/GIFT155/20221108145413L.png" alt="사은품 이미지">
														<p>[랜덤] 오늘의 스마트 샘플 [1]</p>
													</label>
												</li>

											<!--리뷰 작성 사은품 -->
										<!--쿠폰 사은품 -->
										</ul>
								</div>
							</article>
							
							
					<article class="orderer">
								<h3>주문자 정보</h3>

								<div class="table-wrap">
									<table class="no-border-table">
										<colgroup>
											<col width="208px">
											<col width="auto">
										</colgroup>
										<tbody>
										<tr>
											<th>주문자 정보</th>
											<td>
												<ul class="info-ul no-border">
													<li id="bName"><span id="childBName">김지훈</span> <a href="javascript:;" class="pop-open" data-class="orderer"><span>주문자 정보 변경</span></a></li>
													<li id="bEmail">okol4561@naver.com</li>
													<li id="bMobile">010-4920-4748</li>
													<li id="bAddress">
														
															(02584)
														<span>서울 동대문구 왕산로 72 (동대문한양아이클래스)</span>704호</li>
												</ul>
											</td>
										</tr>
										</tbody>
									</table>
								</div>
							</article>
							<article class="receiver">
								<h3>배송 정보</h3>
								<div class="table-wrap">
									<table class="no-border-table">
										<colgroup>
											<col width="208px">
											<col width="auto">
										</colgroup>
										<tbody>
														<th>배송지</th>
														<td>
															<ul class="info-ul no-border">
																<li>
																	<strong id="deliveryTitle_0">기본 배송지</strong>
																		<a href="javascript:;" onclick="selectAddress(0)" class="pop-open" data-class="receiver"><span>배송지 정보 변경</span></a>
																</li>
																<li id="deliveryName_0">김지훈</li>
																<li id="deliveryMobile_0">010-4920-4748</li>
																<li id="deliveryAddress_0">(02584)<span>서울 동대문구 왕산로 72 (동대문한양아이클래스)</span>704호</li>
																	</ul>
														</td>
													</tr>
													<tr>
														<th>배송 메세지</th>
														<td>
															<div class="select-box long">
																<a href="javascript:;" class="selected-value reveiverMsg" data-receiver-index="0">선택해주세요</a>
																<ul id="selDelMsg" class="option-box" name="">
																	<li>부재시 경비실에 맡겨주세요</li>
																	<li>부재시 문 앞에 놓아주세요</li>
																	<li>직접 받을게요</li>
																	<li>배송전에 연락주세요</li>
																	<li>직접입력</li>
																</ul>
															</div>
															<input type="text" id="receivers[0].content" name="receivers[0].content" placeholder="ex) 부재시 경비실에 맡겨주세요." style="display:none;">
														</td>
													</tr>
												</tbody>
									</table>
								</div>
							</article>
						</div>

			<div class="inner">
				<article class="payment-info">
					<h3>결제 정보
						</h3>

					<ul class="total-wrap flex">
						<li><span>합계</span> <strong>￦ 34,000</strong></li>
								<li class="d-charge"><span>배송비</span> <strong class="op-total-delivery-charge-text">￦ 0</strong></li><li class="total-price ">
							<span>최종 결제 금액</span>
							<strong class="op-order-pay-amount-text">￦ 34,000</strong>
						</li>
					</ul>


					<div class="pgInputArea">

							



	
	

</div><table class="list-table light">
						<colgroup>
							<col width="208px">
							<col width="auto">
						</colgroup>
						<tbody>
						
						<tr>
							<th>결제 수단</th>
							<td class="bills">
								<p class="body1">원활한 결제진행을 위해 팝업차단을 해제해주시기 바랍니다.</p>
								<ul class="pay-type clear">
									<input id="buyPayments'card'.amount" name="buyPayments['card'].amount" class="_number op-order-payAmounts op-default-payment" value="34000" paymenttype="card" type="hidden"><li>
											<input type="radio" id="payType-card" value="card" name="payType"> <label for="payType-card">신용카드</label>
										</li>
									<input id="buyPayments'realtimebank'.amount" name="buyPayments['realtimebank'].amount" class="_number op-order-payAmounts " value="0" paymenttype="realtimebank" type="hidden"><li>
											<input type="radio" id="payType-realtimebank" name="payType" value="realtimebank"> <label for="payType-realtimebank">계좌이체</label>
										</li>
									<input id="buyPayments'vbank'.amount" name="buyPayments['vbank'].amount" class="_number op-order-payAmounts " value="0" paymenttype="vbank" type="hidden"><li>
											<input type="radio" id="payType-vbank" name="payType" value="vbank"> <label for="payType-vbank">가상계좌</label>
										</li>
									<input id="buyPayments'hp'.amount" name="buyPayments['hp'].amount" class="_number op-order-payAmounts " value="0" paymenttype="hp" type="hidden"><li>
											<input type="radio" id="payType-hp" name="payType" value="hp"> <label for="payType-hp">휴대폰결제</label>
										</li>
									<input id="buyPayments'kakaopay'.amount" name="buyPayments['kakaopay'].amount" class="_number op-order-payAmounts " value="0" paymenttype="kakaopay" type="hidden">




     <li>
											<input type="radio" id="payType-kakaopay" name="payType" value="kakaopay"> <label for="payType-kakaopay">카카오페이</label>
										</li>

									<input id="buyPayments'payco'.amount" name="buyPayments['payco'].amount" class="_number op-order-payAmounts " value="0" paymenttype="payco" type="hidden"><li>
											<input type="radio" id="payType-payco" name="payType" value="payco"> <label for="payType-payco">페이코</label>
										</li>
									</ul>
							</td>
						</tr>

						</tbody>
					</table>
				</article>
				
				<article class="btn-wrap">
					<div class="input-box">
						<input type="checkbox" id="agree" name="agree"><label for="agree"><span>(필수)</span>구매하실 제품의 결제정보를 확인하였으며, 구매진행에 동의합니다.</label>
					</div>
					<button type="submit" id="payment-button" name="" class="green-btn"><strong class="op-order-pay-amount-text">￦ 34,000</strong> <strong>결제하기</strong></button>
				</article>
				
			</div>
		</div>
	<div>
</div></form></section>
</body>
</html>