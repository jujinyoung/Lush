<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>2022. 12. 28. 오전 10:49:03</title>
<link rel="stylesheet" type="text/css" href="css/mypageCart.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>

</style>
</head>
<body>

	<!-- HEADER -->
	<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
	<!-- HEADER // -->

	<script type="text/javascript"
		src="https://pay.naver.com/customer/js/naverPayButton.js"
		charset="UTF-8"></script>
	<script type="text/javascript"
		src="/content/modules/naverpay/naver.pay.js"></script>

	<script>
		var item = new Array();
		var itemCart = new Object();
		// 네이버 페이 연동시 필요한 현재 체크된 제품정보 조회
		function setNaverPayInitData() {

			var cartIds = new Object;
			var $selectedItems = $("#listForm [id*=cart_]:checked");

			if (!$selectedItems.length) {
				alert("주문하실 제품을 선택해주세요.");
				return false;
			}

			var exitFlag = false;
			$selectedItems.each(function(i, inp) {

				if ($(this).attr("data-item-taxType") == '2') {
					alert("면세 제품은 일반 결제로 이용해주시기 바랍니다.");
					exitFlag = true;
					return false;
				}

				cartIds[i] = $(inp).val();
			});

			if (exitFlag) {
				return false;
			}

			var params = {
				'cartIds' : cartIds
			};

			$
					.post(
							'/cart/get-selected-item-data',
							params,
							function(response) {

								if (response.isSuccess) {
									var itemDatas = response.data.items;

									$
											.each(
													itemDatas,
													function(i, d) {

														itemCart["item_"
																+ d.cartId] = {
															itemId : d.itemId,
															itemName : d.itemName,
															itemUserCode : d.itemUserCode,
															quantity : d.itemPrice.quantity,
															// optionPrice : d.itemPrice.optionPrice,
															price : Number(d.itemPrice.price),
															itemPrice : Number(d.itemPrice.price),
															shipping : response.data.orderPrice.totalShippingAmount,
															imageSrc : d.item.imageSrc,
															type : 'cart',
															taxType : d.item.taxType
														};

														var options = d.optionList;
														var optionArray = new Array();

														if (null !== options
																&& options.length > 0
																&& d.item.itemOptionFlag == "Y") {

															$
																	.each(
																			options,
																			function(
																					i,
																					opt) {
																				var optionValue = opt.itemOptionId;
																				var optionTitle = d.itemName;
																				var optionText = opt.optionName2;
																				var optionQuantity = Number(d.itemPrice.quantity);
																				var optionItemPrice = d.itemPrice.saleAmount
																						/ optionQuantity
																						- Number(d.itemPrice.price);
																				var optList = {
																					"optionText" : optionTitle
																							+ ' : '
																							+ optionText,
																					"optionPrice" : optionItemPrice,
																					"optionQuantity" : optionQuantity,
																					"itemOptionId" : optionValue
																				};

																				optionArray
																						.push(optList);
																			});

															if (optionArray.length > 0) {
																itemCart["item_"
																		+ d.cartId].optionArray = optionArray;
															}
														}
													});

									NaverPay_buyButtonHandlerForCart();
								} else {
									alert(response.errorMessage);
								}
							});
		}
	</script>

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
					<li><a href="/cart/1" class="on">일반배송 (1)</a></li>
					<li><a href="/cart/2">스파 (1)</a></li>
				</ul>
				<!-- 일반배송 탭 -->
				<div class="tab-cont">
					<div class="tab-inner on">
						<input type="hidden" id="shippingFreeAmount" value="">
						<input type="hidden" id="shippingAmount" value="">
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
										<th>
											<input type="checkbox" id="cart-all" name="id" class="check-all">
											<label for="cart-all"></label>
										</th>
										<th></th>
										<th class="text-left">제품 정보</th>
										<th>수량</th>
										<th>금액</th>
										<th>합계금액</th>
									</tr>
								</thead>
								<tbody>
									<script type="text/javascript" class="script-area">
										var buyItem = {
											"itemId" : Number("9"),
											"itemName" : "씨 베지터블",
											"quantity" : Number("1"),
											"price" : Number("12000"),
											"shipping" : 0
										};
										var optionArray = new Array();
										var optionText = $.trim("");
										if (optionText != ""
												&& optionText != null) {
											optionArray.push({
												"optionText" : optionText,
												"optionPrice" : 0,
												"optionQuantity" : "1"
											});
											buyItem.optionArray = optionArray;
										}
										try {
											itemCart.item_2670731 = buyItem;
										} catch (e) {
										}
										$(function() {
											$(".script-area").remove();
										});
									</script>
									<tr>
										<input type="hidden" name="stockFlag" id="stockFlag-2670731" value="Y" />
										<input type="hidden" name="stockQuantity" id="stockQuantity-2670731" value="1400" />
										<input type="hidden" name="orderMinQuantity" id="orderMinQuantity-2670731" value="1" />
										<input type="hidden" name="orderMaxQuantity" id="orderMaxQuantity-2670731" value="20" />
										<input type="hidden" name="shippingGroupCode" id="shippingGroupCode-2670731" value="SHIPMENT-436" />
										<input type="hidden" name="orderAmount" id="stockQuantity-2670731" value="1400" />
										<input type="hidden" name="itemName" id="itemName-2670731" value="씨 베지터블" />
										<input type="hidden" name="itemOptionStock" id="itemOptionStock-2670731" value=" " />
										<input type="hidden" name="optionName" id="optionName-2670731" value="" />
										<input type="hidden" name="itemOrderMaxQuantity" id="itemOrderMaxQuantity-2670731" value="20" />
										<td>
										<input type="checkbox" id="cart_2670731" name="id"
											value="2670731" data-item-id="9" data-parent-item-id="0"
											data-item-am="12000" data-item-taxType="1"
											title="씨 베지터블 체크박스" class="op-available-item">
											<label for="cart_2670731"></label>
										</td>
										<input type="hidden" id="op-shipping-payment-type-2670731" name="shippingPaymentType" />
										<td class="cart-prd-img">
											<a href="/products/view/9">
												<img src="../item/9/20220722071806M.png" alt="dummy 제품 이미지">
											</a>
										</td>
										<td class="text-left">
											<a href="/products/view/9">
												<p class="subtitle" id="cartData-2670731" data-store-qt="1" data-store-id="9" data-store-nm="씨 베지터블" data-store-va="" data-store-am="12000">씨 베지터블</p>
											</a>
											<p class="cate body1">솝</p>
											<p class="option body2"></p>
										</td>
										<td>
											<div class="quantity-box">
												<button type="button" class="q-minus" onclick="editQty('2670731', -1)">
													<img src="../images/ico/ico_minus_gray.svg" width="12px" height="auto" alt="수량감소">
												</button>
												<input type="text" class="quantity" id="quantity-2670731" value="1" onKeyup="this.value=this.value.replace(/[^-0-9]/g,'');">
												<button type="button" class="q-plus" onclick="editQty('2670731', 1)">
													<img src="../images/ico/ico_plus_black.svg" width="12px" height="auto" alt="수량증가">
												</button>
											</div>
										</td>
										<td id="itemSalePrice-2670731">￦12,000</td>
										<td id="itemSaleAmount-2670731">￦12,000</td>
									</tr>
								</tbody>
							</table>
						</form>
						<div class="table-button">
							<button type="button" class="border-btn" onclick="deleteList()">선택삭제</button>
							<button type="button" class="border-btn" onclick="addToWishList()" >선택 찜하기</button>
						</div>

						<ul class="total-wrap flex">
							<li>
								<span>선택제품</span> 
								<!-- 체크된 체크박스 개수 -->
								<strong id="op-select-list-count">0 개</strong>
							</li>
							<li>
								<span>제품합계</span> 
								<!-- 체크된 체크박스 : sum(수량 * 금액) -->
								<strong id="op-select-list-amount">￦ 0</strong>
							</li>
							<li class="d-charge">
								<span>배송비</span>
								<!-- 제품합계가 0이 아니면서 30000원 이하이면 2500원 나머지 0원 -->
								<strong id="op-select-d-charge">￦ 0</strong>
							</li>
							<li class="total-order">
								<span>주문금액</span>
								<!-- 제품합계 + 배송비 -->
								<strong id="total-amount">￦ 0</strong>
							</li>
						</ul>

						<div class="cart-notice">
							<p class="body2">
								*장바구니제품은 30일간 보관됩니다. 더 오래 보관하시려면 <span class="green">[찜하기]</span>로
								등록하세요.
							</p>
							<p class="body2">*장바구니제품이 품절되면 자동으로 목록에서 삭제됩니다.</p>
							<p class="body2">*스파는 일반배송 제품과 별도로 결제를 진행할 수 있습니다.</p>
							<p class="body2">*스파는 신용카드, 계좌이체만 가능합니다.</p>
						</div>

						<div class="btn-wrap large double">
							<button type="button" id="" name="" class="border-btn" onClick="history.back(-1);">쇼핑 계속하기</button>
							<button type="button" name="" class="black-btn" onClick="orderList()">
								<strong>주문하기</strong>
							</button>
						</div>
						<div class="naver-dummy">
							<script type="text/javascript">
                                naver.NaverPayButton
                                    .apply({
                                        //BUTTON_KEY : "2FB54236-7193-4F4B-B15E-1C1559A56B91", //"버튼 인증 키", // 체크아웃에서 제공받은 버튼 인증 키 입력
                                        BUTTON_KEY : "1A704E82-9736-49CF-A634-1DF27AF7963F", //"버튼 인증 키", // 체크아웃에서 제공받은 버튼 인증 키 입력
                                        TYPE : "A", //버튼 모음 종류 설정
                                        COLOR : 1, // 버튼 모음의 색 설정
                                        COUNT : 1, // 버튼 개수 설정. 구매하기 버튼만 있으면(장바구니 페이지) 1, 찜하기 버튼도 있으면(상품 상세 페이지) 2를 입력.
                                        ENABLE : "Y", // 품절 등의 이유로 버튼 모음을 비활성화할 때에는 "N" 입력
                                        BUY_BUTTON_HANDLER : setNaverPayInitData, // 구매하기 버튼 이벤트 Handler 함수 등록, 품절인 경우 not_buy_nc 함수 사용
                                        BUY_BUTTON_LINK_URL : "", // 링크 주소 (필요한 경우만 사용) (http://mydomain.com/buy/url/)
                                        WISHLIST_BUTTON_HANDLER : NaverPay_wishlistButtonHandler, // 찜하기 버튼 이벤트 Handler 함수 등록
                                        WISHLIST_BUTTON_LINK_URL : "", // 찜하기 팝업 링크 주소(http://mydomain.com/wishlist/popup/url/)
                                        "" : ""
                                    });

                                var NaverPay = {"payPopupUrl" : ""
                                    , "wishlistPopupUrl" : ""};
                                //console.log(NaverPay);

                                // 네이버 페이 버튼 영역 숨김처리
                                $(".npay_storebtn_bx").css({opacity: 1});

                                function payByNaver() {
                                    $(".npay_btn_link.npay_btn_pay").click();
                                }
                            </script>
							<div id="NC_ID_1672204875451549" class="npay_storebtn_bx npay_type_A_1" style="opacity: 1;">
								<div id="NPAY_BUTTON_BOX_ID" class="npay_button_box ">
									<div class="npay_button">
										<div class="npay_text">
											<span class="npay_blind">NAVER 네이버 ID로 간편구매 네이버페이</span>
										</div>
										<table class="npay_btn_list" cellspacing="0" cellpadding="0">
											<tbody>
												<tr>
													<td class="npay_btn_item">
														<a id="NPAY_BUY_LINK_IDNC_ID_1672204875451549" href="#" class="npay_btn_link npay_btn_pay btn_green" style="box-sizing: content-box;" title="새창">
															<span class="npay_blind">네이버페이 구매하기</span>
														</a>
													</td>
												</tr>
											</tbody>
										</table>
									</div>
									<div id="NPAY_EVENT_ID" class="npay_event">
										<a id="NPAY_PROMOTION_PREV_IDNC_ID_1672204875451549" href="#" class="npay_more npay_more_prev">
											<span class="npay_blind">이전</span>
										</a>
										<p id="NPAY_PROMOTION_IDNC_ID_1672204875451549" class="npay_event_text">
											<strong class="event_title">CU더블혜택</strong>
											<a class="event_link" href="https://m-campaign.naver.com/collect/v2/?code=2021120101_210201_008_inc_103101_20211201001_shopping_pay&amp;target=https://m-campaign.naver.com/npay/cuplus_npay/" target="_blank" title="새창">최대 5%적립+최대5%할인</a>
										</p>
										<a id="NPAY_PROMOTION_NEXT_IDNC_ID_1672204875451549" href="#" class="npay_more npay_more_next">
											<span class="npay_blind">다음</span>
										</a>
									</div>
								</div>
							</div>
							<!-- 일반배송 탭 //-->
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

<div class="dimmed">

<!-- 선택삭제 팝업 -->
<div class="popup selected-del" id="popupDel" style="display:none;">
    <div class="pop-head">
    <div class="pop-content">
        <p class="body1">
            제품을 장바구니에서 <br/>
            삭제하시겠습니까?
        </p>
    </div>
    <div class="btn-wrap basic double">
        <button type="button" class="border-btn pop-close cancle" id="" name="">취소</button>
        <button type="button" class="black-btn pop-close confirm" id="op-cart-list-delete" name="">확인</button>
    </div>
    <button type="button" id="closeBtn" class="pop-close popup-close-btn" name="">팝업닫기</button>
	</div>
</div>
<!-- 선택삭제 팝업 //-->

<!-- 찜리스트 팝업 -->

    <div class="popup zzim" id="cartZzimPopup" style="display: none;">
    	<div class="pop-head">
        	<h3 class="center">제품이 찜리스트에 담겼습니다.</h3>
    	</div>
    	<div class="pop-content">
        	<p class="body1" id="zzim_count"></p>
    	</div>
    	<div class="btn-wrap basic double">
        	<button type="button" class="cancle border-btn pop-close" id="" name="">계속 쇼핑하기</button>
        	<button type="button" onclick="goWishList();" class="confirm black-btn pop-close" id="" name="">확인</button>
    	</div>
    <button type="button" id="closeBtn" class="pop-close popup-close-btn" name="">팝업닫기</button>
	</div>
	
<!-- 찜리스트 팝업 //-->

</div>



<!-- // 1285 -->
<script>

var buttonType ="";

var $acIds = $('#listForm').find('input[name=id]');
var atItems = [];

let $availableItem = $(':checkbox[class^=op-available-item]:checked');


$(function() {
	
	/* 체크박스 */
	$('.check-all').click(function(){
		var checked = $('.check-all').is(':checked');
		
		if(checked) $('input:checkbox').prop('checked', true);
		else $('input:checkbox').prop('checked', false);
	});
	
	$(':checkbox[class^=op-available-item]').change(function(){
		if($(':checkbox[class^=op-available-item]').length == $(':checkbox[class^=op-available-item]:checked').length ) $('.check-all').prop('checked', true);
		else $('.check-all').prop('checked', false);
	});
	
	/*
	<button type="button" class="q-minus" onclick="editQty('2670731', -1)">
	<button type="button" class="q-plus" onclick="editQty('2670731', 1)">
	*/
	/* 수량 - + */
    function editQty(cartId, value){
        let quantity = $('#quantity-' + cartId).val();
        $('#quantity-' + cartId).val(parseInt(quantity) + parseInt(value));
        editQuantity(cartId);
    }
	
	/*
	<button type="button" class="border-btn" onclick="deleteList()">선택삭제</button>
	*/
	/* 선택삭제 */
	function deleteList(){
		alert("deleteList()");

        if($availableItem.size() == 0){
            alert("삭제할 항목을 선택해 주세요.");
            return;
        }

        $("#popupDel").show();
        $(".dimmed").addClass("on");
        $("header").css("z-index",10);
		
    };
    
    /*
    <button type="button" class="border-btn" onclick="addToWishList()" >선택 찜하기</button>
    */
    /* 선택 찜하기 */
    function addToWishList(){
    	alert("addToWishList");
    	
    	if($availableItem.size() == 0){
    		alert("찜할 항목을 선택해 주세요.");
    	}
    	
    	$("#cartZzimPopup").show();
    	$(".dimmed").addClass("on");
    	$("header").css("z-index", 10);
    	
    	
    };
    
    /*
    <button type="button" name="" class="black-btn" onClick="orderList()">
		<strong>주문하기</strong>
	</button>
	*/
    /* 주문하기 */
    function orderList(){
		alert("orderList");
        let $availableItem = $(':checkbox[class^=op-available-item]:checked');

        if($availableItem.size() == 0){
            alert("처리할 항목을 선택해 주세요.");
            return;
        }

        $("#popupOrder").show();
        $(".dimmed").addClass("on");
        $("header").css("z-index",10);

    }

});
</script>


<script>

/*
<ul class="total-wrap flex">
							<li>
								<span>선택제품</span> 
								<!-- 체크된 체크박스 개수 -->
								<strong id="op-select-list-count">0 개</strong>
							</li>
							<li>
								<span>제품합계</span> 
								<!-- 체크된 체크박스 : sum(수량 * 금액) -->
								<strong id="op-select-list-amount">￦ 0</strong>
							</li>
							<li class="d-charge">
								<span>배송비</span>
								<!-- 제품합계가 0이 아니면서 30000원 이하이면 2500원 나머지 0원 -->
								<strong id="op-select-d-charge">￦ 0</strong>
							</li>
							<li class="total-order">
								<span>주문금액</span>
								<!-- 제품합계 + 배송비 -->
								<strong id="total-amount">￦ 0</strong>
							</li>
</ul>
*/



</script>

<!--
header.jsp

<span class="basket-cnt" id="header_cart_quantity">4</span>
																	장바구니 제품 개수
																	장바구니에 담을때 마다 ++
																	삭제할 때마다 --


  -->

</body>
</html>