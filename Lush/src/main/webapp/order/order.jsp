<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
request.setCharacterEncoding("UTF-8");
String contextPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>러쉬 ORDER</title>
<link rel="stylesheet" href="css/order_style.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="icon" type="image/png" sizes="192x192"
	href="/Lush/images/ico/fabicon.png">
<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
</head>

<body>
	<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>


	<section id="order" style="padding-top: 128px;">
		<form id="buy" name="buy" action="<%=contextPath%>/order/order.do"
			method="post">

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

								<c:forEach var="pro" items="${productlist}">
								<input type="hidden" name="psid" value=${ pro.psid }>
								<input type="hidden" name="amount" value=${ pro.amount }>
									<tr>
										<td class="cart-prd-img"><img
											src="https://www.lush.co.kr/upload/item/15/20220929153226L.png"
											alt="dummy 제품 이미지"> <input type="hidden" id="pname"
											name="pname" value="${ pro.name }"></td>

										<td class="text-left">
											<p class="subtitle" id="cartData-0">${ pro.name }</p>
											<p class="cate body1">${ pro.cat3 }</p>
											<p class="option body2"></p>
											<ul class="option">
												<li><span class="choice">용량 : </span><span>${ pro.weight }
														g</span></li>
											</ul>
											<p></p>
										</td>
										<td>
											<div class="quantity-box">
												<input type="text" class="quantity" id="quantity-0"
													value="${ pro.amount }" readonly="">
											</div>
										</td>
										<td id="itemSalePrice-0">￦ ${ pro.price }</td>
										<td id="itemSaleAmount-0"><p id="result">￦ ${ pro.price * pro.amount }</p></td>
									</tr>
								</c:forEach>
							</tbody>
							<tfoot class="cal">
								<tr>
									<td colspan="5">
										<ul class="total-wrap flex">
											<li><span>선택제품</span> <strong>${ totalamount }
													개</strong></li>
											<li><span>제품합계</span> <strong>￦ ${totalprice }</strong></li>
											<li class="d-charge"><span>배송비</span> <strong
												class="op-total-delivery-charge-text">￦ ${ delprice }</strong></li>
											<li><span>주문금액</span> <strong
												class="op-order-pay-amount-text">￦ ${totalprice + delprice}</strong></li>
										</ul>
									</td>
								</tr>
							</tfoot>
						</table>
					</article>

					<article class="service flex top">

						<div class="dukzzi">
							<h3>
								발급 덕찌 안내 <span>(덕찌는 구매확정 시 지급됩니다.)</span>
							</h3>
							<img src="/Lush/images/order/dukzzi.png" class="dukzzi-image"
								alt="덕찌 이미지"> <span>12월 또담아찌</span><br> <br>
						</div>
						<div class="gift">
							<h3>
								사은품 선택 <span>(체크박스 미선택 시 사은품 적용이 불가합니다.)</span>
							</h3>
							<ul>
								<!-- 구매 사은품 -->
								<li><input type="checkbox" id="g2_94" name="giftItemIds">
									<input type="hidden" id="giftbox" name="giftbox" value="">
									<label for="g2_94"> <img
										src="/Lush/images/order/gift.png" alt="사은품 이미지">
										<p>[랜덤] 오늘의 스마트 샘플 [1]</p>
								</label></li>

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
												<li id="bName"><span id="childBName">${ member.name }</span>
													<input type="hidden" id="membername" name="membername"
													value=" ${member.name }" /></li>

												<li id="bEmail">${ member.email }</li>
												<li id="bMobile">${ member.telnum }<input type="hidden"
													id="telnum" name="telnum" value=" ${member.telnum }" />
												</li>
												<li id="bAddress"><span>${ member.address }</span> <input
													type="hidden" id="addr1" name="addr1"
													value=" ${member.address }" /></li>
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
									<tr>
										<th>배송지</th>
										<td>
											<ul class="info-ul no-border">
												<li><strong id="deliveryTitle_0">기본 배송지</strong>
													<button type="button" class="open-button" id="baesong">
														<span> 배송지 추가 </span>
													</button></li>
												<li id="dellsname">${ shipadd.sname }</li>
												<li id="delloname">${ shipadd.oname }</li>
												<li id="dellmobile">${ shipadd.telnum1 }</li>
												<li id="delladd"><span>${ shipadd.address }</span></li>
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
												</select> <input type="hidden" id="delmsginput" name="delmsg"
													value="">

											</div>
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</article>
				</div>

				<div class="inner">
					<article class="payment-info">
						<h3>결제 정보</h3>

						<ul class="total-wrap flex">
							<li><span>합계</span> <strong>￦ ${totalprice }</strong></li>
							<li class="d-charge"><span>배송비</span> <strong
								class="op-total-delivery-charge-text">￦ ${delprice}</strong></li>
							<li class="total-price "><span>최종 결제 금액</span> <strong
								class="op-order-pay-amount-text">￦ ${totalprice + delprice }</strong>
							</li>
						</ul>


						<div class="pgInputArea"></div>
						<table class="list-table light">
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
											<li><input type="radio" id="payType-card" value="card"
												name="payType" disabled> <label for="payType-card">신용카드</label>
											</li>
											<li><input type="radio" id="payType-realtimebank"
												name="payType" value="realtimebank" disabled> <label
												for="payType-realtimebank">계좌이체</label></li>
											<li><input type="radio" id="payType-vbank"
												name="payType" value="vbank" disabled> <label
												for="payType-vbank">가상계좌</label></li>
											<li><input type="radio" id="payType-hp" name="payType"
												value="hp" disabled> <label for="payType-hp">휴대폰결제</label>
											</li>
											<li><input type="radio" id="payType-kakaopay"
												name="payType" value="kakaopay"> <label
												for="payType-kakaopay">카카오페이</label></li>
											<li><input type="radio" id="payType-send" name="payType"
												value="send"> <label for="payType-send">무통장입금</label>
											</li>
										</ul>
									</td>
								</tr>

							</tbody>
						</table>
					</article>

					<article class="btn-wrap">
						<div class="input-box">
							<input type="checkbox" id="agree" name="agree"><label
								for="agree"><span>(필수)</span>구매하실 제품의 결제정보를 확인하였으며,
								구매진행에 동의합니다.</label>
						</div>
						<input type="hidden" id="totalprice1" name="totalprice1"
							value=" ${totalprice + delprice }" /> <input type="hidden"
							id="amount" name="totalamount" value="${ totalamount }"> <input
							type="hidden" id="ordernum" name="ordernum" value="${ ordernum }">
						 <input type="hidden" name="fromwhere" value=${ fromwhere }>
						<button type="button" id="payment-button" name=""
							class="green-btn">
							<strong class="op-order-pay-amount-text"><strong>￦ ${totalprice + delprice }</strong>
								<strong>결제하기</strong>
						</button>
						<button type="submit" id="real"></button>
					</article>

				</div>
			</div>
			<div></div>
		</form>
	</section>


	<div class="dimmed" id="myForm">
		<div class="popup big add-address" style="display: block;">
			<div class="pop-head">
				<h2 class="big">배송지 추가</h2>
			</div>
			<div class="pop-content">
				<table class="no-border-table">
					<colgroup>
						<col width="122px">
						<col width="auto">
					</colgroup>
					<tbody>
						<tr>
							<th>배송지명</th>
							<td><input type="text" name="title" maxlength="50" value="">
								<input type="hidden" id="dtitle" value=""></td>
						</tr>
						<tr>
							<th>받는사람 이름</th>
							<td><input type="text" name="userName" maxlength="50"
								value=""> <input type="hidden" id="duserName" value=""></td>
						</tr>
						<tr>
							<th>전화번호</th>
							<td><input type="text" name="phone" maxlength="11" value="">
								<input type="hidden" id="dphone" value=""></td>
						</tr>
						<tr>
							<th>휴대전화 번호</th>
							<td><input type="text" name="mobile" maxlength="11" value="">
								<input type="hidden" id="dmobile" value=""></td>
						</tr>
						<tr class="address">
							<th>주소</th>
							<td><input type="text" name="address" id="newaddress"
								class="required" readonly="">
								<button type="button" class="border-btn" onclick="findAddr()">주소
									검색</button></td>
						</tr>
					</tbody>
				</table>
				<b>기본 배송지 설정하시겠습니까?</b>
				<p>
				<div>
					<input type="radio" id="yes" name="defaultadd" value="yes" checked>
					<label for="yes">네</label>
				</div>

				<div>
					<input type="radio" id="no" name="defaultadd" value="no"> <label
						for="no">아니요</label> <input type="hidden" id="ddefault" value="">
				</div>
			</div>
			<div class="btn-wrap large double">
				<button type="button" class="border-btn pop-close">취소</button>
				<button type="button" class="black-btn" id="userDeliveryAdd">
					추가하기</button>
			</div>
			<button type="button" id="closeBtn" class="pop-close popup-close-btn"
				name="">팝업닫기</button>
			<div></div>
		</div>
	</div>
	<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>

</body>

<script>
/* $("#ddefault").val($('input[name="defaultadd"]'));
$("#dtitle").val($('input[name="title"]'));
$("#duserName").val($('input[name="userName"]'));
$("#dphone").val($('input[name="phone"]'));
$("#mobile").val($('input[name="mobile"]')); */


	$("#userDeliveryAdd").click(function(){
        $.ajax({
            url:"/Lush/order/ordership.json" ,
            dataType:"json",
            type:"POST",
            data: {
            	mid : ${ member.mid },
                defaultadd : $('input:radio[name="defaultadd"]:checked').val(),
        	    address  : $('input[name=address]').val(),
        	    sname : $('input[name=title]').val(),
        	    oname : $('input[name=userName]').val(),
        	    telnum1 : $('input[name=phone]').val(),
        	    telnum2 : $('input[name=mobile]').val()
            },
            cache:false ,
            success: function (data){
            	var jo = JSON.parse(JSON.stringify(data));
            	if(jo.dellup === "yes"){
            		$("#delloname").text(jo.delloname);
                	$("#dellsname").text(jo.dellsname);
                	$("#dellmobile").text(jo.dellmobile);
                	$("#delladd").text(jo.delladd);
                	
            	}
            	$("#myForm").attr('class', 'dimmed');
            	$("#myForm input[name=title]").val("");
            	$("#myForm input[name=userName]").val("");
            	$("#myForm input[name=phone]").val("");
            	$("#myForm input[name=mobile]").val("");
            	$("#myForm input[name=address]").val("");
            	
            },
            error:function (){
                alert("에러! ");
                $("#myForm").attr('class', 'dimmed');
            	$("#myForm input[name=title]").val("");
            	$("#myForm input[name=userName]").val("");
            	$("#myForm input[name=phone]").val("");
            	$("#myForm input[name=mobile]").val("");
            	$("#myForm input[name=address]").val("");
            }
        });
    });
</script>

<script>
var psidArr = new Array();
var pdidArr = new Array();

<c:forEach var="pro" items="${productlist}">
	psidArr.push(${ pro.psid })
	psidArr.push(${ pro.amount })
	pdidArr.push(${ pro.pid })
	pdidArr.push(${ pro.amount })
</c:forEach>
	
var ordercheck = {
		"psidamountlist": psidArr
};

var tradeupdate = {
		"pdidlist": pdidArr
};

	$("#payment-button").click(function(evt){
		if($("input:checkbox[id='agree']").is(":checked") && ( $("#payType-kakaopay").is(':checked') || $("#payType-send").is(':checked') )){
			if($("#payType-kakaopay").is(':checked')){
            	// 재고 빼기
 				$.ajax({
            		url:"/Lush/order/ordercm.json",
            		dataType:"json",
            		type:"POST",
            		data: ordercheck,
            		cache:false ,
            		success: function (data){
            			var jo = JSON.parse(JSON.stringify(data));
            			if(jo.isAmountZero === "0"){
            				IMP.init ("imp23237584");
        					payment(); //버튼 클릭하면 호출
            			}
            			else{
            				alert("재고없음! ");
            			}
            		},
            		error:function (){
                		alert("ordercm 에러! ");
            		}
        		}); 
			}
			else{
				// 무통장 입금 실행
				$.ajax({
	        		url:"/Lush/order/ordercm.json",
	        		dataType:"json",
	        		type:"POST",
	        		data: ordercheck,
	        		cache:false ,
	        		success: function (data){
	        			var jo = JSON.parse(JSON.stringify(data));
	        			if(jo.isAmountZero === "0"){
	        				alert("재고 감소 완료! ");
	        			}
	        			else{
	        				alert("재고없음! ");
	        			}
	        		},
	        		error:function (){
	            		alert("ordercm 에러! ");
	        		}
	    		}); 
				
				//해당 제품 거래수 증가 
	        	$.ajax({
	        		url:"/Lush/order/ordert.json",
	        		dataType:"json",
	        		type:"POST",
	        		data: tradeupdate,
	        		cache:false ,
	        		success: function (data){
	        			alert("거래수 증가 ajax 성공! ");
	        		},
	        		error:function (){
	            		alert("거래수 증가 ajax 실패! ");
	        		}
	    		}); 
				
	        	// submit으로 form 태그 원래대로 post
	         	$("#real").trigger("click");
			}
			
		}
		else{
			alert("필수 버튼 체크!"); 
		}
	})

    function payment() {
        // IMP.request_pay(param, callback) 결제창 호출
        IMP.request_pay({ // param
            pg: "kakaopay.TC0ONETIME",
            pay_method: "card",
            merchant_uid: 'c' + $('#ordernum').val(),
            name: $("#pname").val() + " 등 " + $('#totalamount').val() +  "개",
            amount: $("#totalprice1").val(),
            buyer_name: $("membername").val(),
            buyer_tel: $("#telnum").val(),
            buyer_addr: $("#addr1").val()
        }, function (rsp) { // callback
            if (rsp.success) {
            	alert("결제성공");
            	//해당 제품 거래수 증가 
            	$.ajax({
            		url:"/Lush/order/ordert.json",
            		dataType:"json",
            		type:"POST",
            		data: tradeupdate,
            		cache:false ,
            		success: function (data){
            			alert("거래수 증가 ajax 성공! ");
            		},
            		error:function (){
                		alert("거래수 증가 ajax 실패! ");
            		}
        		}); 
            	
            	// submit으로 form 태그 원래대로 post
             	$("#real").trigger("click");

            } else {
            	alert("결제실패");
            	// 재고 다시 원상복귀
            	$.ajax({
            		url:"/Lush/order/orderp.json" ,
            		dataType:"json",
            		type:"POST",
            		data: ordercheck,
            		cache:false ,
            		success: function (data){
            			alert("재고 원상복귀 ajax 성공! ");
            		},
            		error:function (){
                		alert("재고 원상복귀 ajax 실패! ");
            		}
        		}); 
            }
        });
      }
	
</script>

<script
	src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js">
</script>
<script>
function findAddr(){
	new daum.Postcode({
        oncomplete: function(data) {
        	
        	console.log(data);
        	
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var jibunAddr = data.jibunAddress; // 지번 주소 변수
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            if(roadAddr !== ''){
                document.getElementById("newaddress").value = roadAddr;
            } 
            else if(jibunAddr !== ''){
                document.getElementById("newaddress").value = jibunAddr;
            }
        }
    }).open();
}
</script>

<script>

$("button.open-button").click( function (){
	// alert("!!");
	$("#myForm").attr('class', 'dimmed on');
	$("#myForm input[name=title]").focus();
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

$("#delmsginput").val("부재시 경비실에 맡겨주세요");

$("#delmsgselect").change(function(){
	var valss = $("#delmsgselect option:selected").val();
	$("#delmsginput").val(valss);
}); 

$("#giftbox").val("no");

$("#g2_94").click(function() {
    if($("#g2_94").is(":checked")) {
        $("#giftbox").val("yes");
    } else {
        $("#giftbox").val("no");
    }
});

</script>



</html>