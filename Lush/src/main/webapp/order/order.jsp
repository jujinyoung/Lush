<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
      request.setCharacterEncoding("UTF-8");
      String contextPath = request.getContextPath();
      int amount = Integer.parseInt(request.getParameter("amount"));
      int pid = Integer.parseInt(request.getParameter("pid"));
      int weight = Integer.parseInt(request.getParameter("weight"));

%>
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
    <td class="cart-prd-img"><img src=${ product.img } alt="dummy 제품 이미지"></td>
    <td class="text-left">
        <p class="subtitle" id="cartData-0">${ product.name } </p><p class="cate body1">${ product.cat3 } </p>
                <p class="option body2"></p><ul class="option"><li> <span class="choice">용량 : </span><span>${ productsangse.weight } g</span> </li></ul><p></p>
                </td>
    <td>
        <div class="quantity-box">
            <input type="text" class="quantity" id="quantity-0" value="<%= amount %>" readonly="">
        </div>
    </td>
<td id="itemSalePrice-0">￦ ${ productsangse.price }</td>
        <td id="itemSaleAmount-0"><p id="result"></p></td>
</tr>
<%-- </c:forEach>
 --%>
</tbody>
						<tfoot class="cal">
						<tr>
							<td colspan="5">
								<ul class="total-wrap flex">
									<li><span>선택제품</span> <strong><%= amount %> 개</strong></li>
<li><span>제품합계</span> <strong id="result2"></strong></li>
										<li class="d-charge"><span>배송비</span> <strong class="op-total-delivery-charge-text">￦ 0</strong></li><li><span>주문금액</span> 	<strong class="op-order-pay-amount-text" id="result5"></strong></li>
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
													<li id="bName"><span id="childBName">${ member.name }</span></li>
													<li id="bEmail">${ member.email }</li>
													<li id="bMobile">${ member.telnum }</li>
													<li id="bAddress"><span>${ member.address }</span></li>
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
																		<button type="button" class="open-button" id="baesong"><span> 배송지 추가 </span></button> 
																</li>
																<li id="deliveryName_0">${ shipadd.oname }</li>
																<li id="deliveryMobile_0">${ shipadd.telnum1 }</li>
																<li id="deliveryAddress_0"><span>${ shipadd.address }</span></li>
																	</ul>
														</td>
													</tr>
													<tr>
														<th>배송 메세지</th>
														<td>
															<div class="select-box long">
																<select id="delmsgselect">
																	<option value="부재시 경비실에 맡겨주세요">부재시 경비실에 맡겨주세요</option>
																	<option value="부재시 문 앞에 놓아주세요">부재시 문 앞에 놓아주세요</option>
																	<option value="직접 받을게요">직접 받을게요</option>
																	<option value="배송전에 연락주세요">배송전에 연락주세요</option>
																</select>
																<input type="hidden" id="delmsginput" name="delmsg" value="" >

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
						<li><span>합계</span> <strong id="result3"></strong></li>
								<li class="d-charge"><span>배송비</span> <strong class="op-total-delivery-charge-text">￦ 0</strong></li><li class="total-price ">
							<span>최종 결제 금액</span>
							<strong class="op-order-pay-amount-text" id="result4"></strong>
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
					<button type="submit" id="payment-button" name="" class="green-btn"><strong class="op-order-pay-amount-text"><strong id="result6"></strong></strong></strong> <strong>결제하기</strong></button>
				</article>
				
			</div>
		</div>
	<div>
</div></form></section>

<!-- <div class="form-popup" id="myForm">
  <form class="form-container" method="post"> -->
<%--     <h1>배송지 추가</h1>

    <label for="address"><b>주소</b></label>
    <input type="text" placeholder="Enter Address" name="address" required>
	<p>
    <b>기본 배송지 설정하시겠습니까?</b><p>
    <div>
        <input type="radio" id="yes" name="default-add-yes" chekced>
        <label for="yes">네</label>
    </div>
    
    <div>
        <input type="radio" id="no" name="default-add-no">
        <label for="no">아니요</label>
    </div>
    <input type="hidden" name="pid" value=<%=pid %>>
    <input type="hidden" name="weight" value=<%=weight %> >
    <input type="hidden" name="amount" value=<%=amount %> >

    <button type="submit" class="btn addchange">수정</button>
    <button type="button" class="btn cancel">닫기</button> --%>
<div class ="dimmed" id="myForm">
    <div class="popup big add-address" style="display: block;">
		<div class="pop-head">
			<h2 class="big">배송지 추가</h2>
			<!--p class="body2">※ 배송지를 입력하시면, 마이페이지 &gt; 배송지 관리에도 등록됩니다.</p-->
		</div>
		<form id="userDelivery" name="userDelivery" method="post">
			<div class="pop-content">
				<table class="no-border-table">
					<colgroup>
						<col width="122px">
						<col width="auto">
					</colgroup>
					<tbody>
					<tr>
						<th>배송지명</th>
						<td><input type="text" name="title" maxlength="50"></td>
					</tr>
					<tr>
						<th>받는사람 이름</th>
						<td><input type="text" name="userName" maxlength="50"></td>
					</tr>
					<tr>
						<th>전화번호</th>
						<td><input type="text" name="phone" maxlength="11"></td>
					</tr>
					<tr>
						<th>휴대전화 번호</th>
						<td><input type="text" name="mobile" maxlength="11"></td>
					</tr>
					<tr class="address">
						<th>주소</th>
						<td>
							<input type="text" name="address">

						</td>
					</tr>
					</tbody>
				</table>
				    <b>기본 배송지 설정하시겠습니까?</b><p>
    <div>
        <input type="radio" id="yes" name="default-add" value="yes" checked>
        <label for="yes">네</label>
    </div>
    
    <div>
        <input type="radio" id="no" name="default-add" value="no">
        <label for="no">아니요</label>
    </div>
			</div>
			<div class="btn-wrap large double">
				<button type="button" class="border-btn pop-close" >취소 </button>
				<button type="submit" class="black-btn" id="userDeliveryAdd"> 추가하기</button>
			</div>
			<button type="button" id="closeBtn" class="pop-close popup-close-btn" name="">팝업닫기</button>
		<div><input type="hidden" name="_csrf" value="c400f9a2-c347-421b-9cb4-65028638e3ab"></div></form>
	</div>
	
	
	
<!--   </form>
</div> -->
</div>



<script>
  var sum = '￦ ';
  sum += String(<%= amount %> * ${ productsangse.price });
  document.getElementById('result').innerHTML = sum;
  document.getElementById('result2').innerHTML = sum;
  document.getElementById('result3').innerHTML = sum;
  document.getElementById('result4').innerHTML = sum;
  document.getElementById('result5').innerHTML = sum;
  document.getElementById('result6').innerHTML = sum;


</script>
<script>

$("button.open-button").click( function (){
	// alert("!!");
	$("#myForm").attr('class', 'dimmed on');
	$("#myForm input[name=title").focus();
});

$("button.border-btn.pop-close").click(function(){
	// alert("!!");
/* 	$("#myForm").hide();
	$("#myForm input[name=email]").val("");
	$("#myForm input[name=psw]").val(""); */
	$("#myForm").attr('class', 'dimmed');
	$("#myForm input[name=title]").val("");
	$("#myForm input[name=userName]").val("");
	$("#myForm input[name=phone]").val("");
	$("#myForm input[name=mobile]").val("");
	$("#myForm input[name=address]").val("");
}); 

$("button.pop-close.popup-close-btn").click(function(){
	// alert("!!");
/* 	$("#myForm").hide();
	$("#myForm input[name=email]").val("");
	$("#myForm input[name=psw]").val(""); */
	$("#myForm").attr('class', 'dimmed');
	$("#myForm input[name=title]").val("");
	$("#myForm input[name=userName]").val("");
	$("#myForm input[name=phone]").val("");
	$("#myForm input[name=mobile]").val("");
	$("#myForm input[name=address]").val("");
}); 

$("#delmsgselect").change(function(){
	var valss = $("#delmsgselect option:selected").val();
	$("#delmsginput").val(valss);

}); 

</script>
</body>
</html>