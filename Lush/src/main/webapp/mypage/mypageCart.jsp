<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>러쉬 장바구니</title>
<link rel="stylesheet" type="text/css" href="css/mypageCart.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="icon" type="image/png" sizes="192x192"
	href="/Lush/images/ico/fabicon.png">

</head>
<body>
	<!-- HEADER -->
	<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
	<!-- HEADER // -->
	<!-- Section -->
	<section id="cart" style="padding-top: 128px;">
		<!-- 제품리스트 -->
		<article class="cart-wrap">
			<!-- inner -->
			<div class="inner">
				<div class="page-top">
					<div class="page-top">
						<h2 class="page-title">장바구니</h2>
					</div>
				</div>
				<ul class="tab-btn type2">
					<li><a href='javascript:void(0);' class="on">일반배송</a></li>
					<li><a href='javascript:void(0);'>스파</a></li>
				</ul>
				<!-- 일반배송 탭 -->
				<div class="tab-cont">
					<div class="tab-inner on">
						<input type="hidden" id="shippingFreeAmount" value=""> <input
							type="hidden" id="shippingAmount" value="">
						<form id="listForm">
							<table class="check-table">
								<colgroup>
									<col width="84px">
									<col width="100px">
									<col width="428px">
									<col width="160px">
									<col width="auto">
									<col width="144px">
								</colgroup>
								<thead>
									<tr>
										<th><input type="checkbox" id="cartall" 
											class="check-all"></th>
										<th></th>
										<th class="text-left">제품 정보</th>
										<th>수량</th>
										<th>금액</th>
										<th>합계금액</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="pro" items="${productlist}">
										<tr>

											<td><input type="checkbox"  class = "chbox" name="chbox"
												title="씨 베지터블 체크박스" value="${ pro.psid }"></td>
											<td class="cart-prd-img"><a href="/products/view/9">
													<img
													src="../images/products/${pro.pid}.png"
													alt="dummy 제품 이미지">
											</a></td>
											<td class="text-left"><a href="/products/view/9">
													<p class="subtitle" id="cartData-2670731">${ pro.name }</p>
											</a>
												<p class="cate body1">${ pro.cat3 }</p>
												<p class="option body2"></p></td>
											<td>
												<div class="quantity-box">
													<button type="button" class="q-minus"
														id="qminus${ pro.psid }" ">
														<img src="/Lush/images/ico/ico_minus_gray.svg"
															width="12px" height="auto" alt="수량감소">
													</button>
													<input type="text" class="quantity" id="q${ pro.psid }"
														value="${ pro.amount }">
													<button type="button" class="q-plus"
														id="qplus${ pro.psid }" >
														<img src="/Lush/images/ico/ico_plus_black.svg"
															width="12px" height="auto" alt="수량증가">
													</button>
												</div>
											</td>
											<td id="price${ pro.psid }">￦ ${ pro.price }</td>
											<td id="pricesum${ pro.psid }">￦ ${ pro.price * pro.amount }</td>
										</tr>
									</c:forEach>
								</tbody>

							</table>
						</form>
						<div class="table-button">
							<button type="button" class="border-btn" id="delbutton" >선택삭제</button>
						</div>

						
						<div style="padding: 15px;"></div>

						<div class="btn-wrap large double">

							<button type="button" id="" name="" class="border-btn"
								onClick="history.back(-1);">쇼핑 계속하기</button>
								<form action="/Lush/order/orderview.do" method="post">
								<input type="hidden" name="fromwhere" value=2>
								<button type="submit" name="" class="black-btn">
								<strong>주문하기</strong>
							</button></form>
							
						</div>

					</div>
				</div>
			</div>
			<!-- inner //-->
		</article>
		<!-- 제품리스트 //-->
	</section>
	<!-- Section //-->



	<!-- FOOTER -->
	<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>
	<!-- FOOTER // -->

	<!-- 팝업처리 -->

	<div class="dimmed" id="popup">

		<!-- 선택삭제 팝업 -->
		<div class="popup selected-del" id="popupDel" >
			<div class="pop-head">
				<div class="pop-content">
					<p class="body1">
						제품을 장바구니에서 <br /> 삭제하시겠습니까?
					</p>
				</div>
				<div class="btn-wrap basic double">
					<button type="button" class="border-btn pop-close cancle" id="cancelbutton"
						name="">취소</button>
					<button type="button" class="black-btn pop-close confirm"
						id="okbutton" name="">확인</button>
				</div>

			</div>
		</div>
		<!-- 선택삭제 팝업 //-->


	</div>

<script>

function sendpost(){
	let i = 0;
	var form = document.createElement("form");
	form.setAttribute("charset", "UTF-8");
	form.setAttribute("method", "Post"); 
	form.setAttribute("action", "/Lush/mypage/mypageCart.do");

	$(".chbox").each(function(){
		if($(this).is(':checked')){
			var hiddenField = document.createElement("input");
			hiddenField.setAttribute("type", "hidden");
			hiddenField.setAttribute("name", "psid");
			hiddenField.setAttribute("value", $(this).val());
			form.appendChild(hiddenField);
			i = i+1;
		}

		
	})
	if(i != 0){
		document.body.appendChild(form);
		form.submit();
	}
	else{
		alert("선택없음!");
	}
	
}

	$("#cartall").click(function(){
	if($("#cartall").prop("checked")){
	    $("#cartall").prop("checked",true);
		$('input:checkbox[name="chbox"]').each(function() {
			$(this).prop("checked",true);
		})

	}else{
	    $("#cartall").prop("checked",false);
	    $('input:checkbox[name="chbox"]').each(function() {
			$(this).prop("checked",false);
		})
	}})

	
$("#delbutton").click( function (){
	// alert("!!");
	$("#popup").attr('class', 'dimmed on');
});

$("#cancelbutton").click( function (){
	// alert("!!");
	$("#popup").attr('class', 'dimmed');
});

$("#okbutton").click( function (){
	// alert("!!");

	sendpost();
	
});

</script>


<script>
<c:forEach var="pro" items="${productlist}">
	$("#qminus${ pro.psid }").click(function(evt){
		if($("#q${ pro.psid }").val() != 1){
			$.ajax({
	    		url:"/Lush/mypage/cartq.json",
	    		dataType:"json",
	    		type:"POST",
	    		data: {
	            	mid : ${ member.mid },
	                plusminus : "m",
	        	    psid  : ${ pro.psid },
	            },
	    		cache:false ,
	    		success: function (data){
	    			$("#q${ pro.psid }").val(Number($("#q${ pro.psid }").val())-1);
	    			$("#pricesum${ pro.psid }").text('￦ '+ (Number($("#q${ pro.psid }").val())) * ${ pro.price } );
	    		},
	    		error:function (){
	        		alert("cartq 에러! ");
	    		}
			}); 
		}
	})
		
	$("#qplus${ pro.psid }").click(function(evt){
			$.ajax({
		    	url:"/Lush/mypage/cartq.json",
		    	dataType:"json",
		    	type:"POST",
		    	data: {
		           	mid : ${ member.mid },
		            plusminus : "p",
		       	    psid  : ${ pro.psid },
		        },
		   		cache:false ,
		   		success: function (data){
		   			$("#q${ pro.psid }").val(Number($("#q${ pro.psid }").val())+1);
		   			$("#pricesum${ pro.psid }").text('￦ '+ (Number($("#q${ pro.psid }").val())) * ${ pro.price } );
		   		},
		    	error:function (){
		       		alert("cartq 에러! ");
		   		}
			}); 
	})
</c:forEach>
</script>


</body>
</html>