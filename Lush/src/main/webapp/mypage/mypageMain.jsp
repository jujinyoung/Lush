<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="mypageMain.css" type="text/css">
</head>
<body>

<jsp:include page="/header/header.jsp"></jsp:include>

<section id="mypage" class="my-page" style="padding-top: 128px;">
<div class="inner flex top">
	<!-- 마이페이지 좌측 메뉴 //-->
	<jsp:include page="/mypage/mypageLeft.jsp"></jsp:include>

	<!-- 마이페이지 우측 컨텐츠 영역 -->
	<article class="my-contents main-page">

	<!-- 현재년도 -->
	<!-- 상단 유저 정보 -->
	<div class="user-box flex">
		<div class="user-info flex center">
	    	<img src="/images/mypage/Logo (1).png" alt="levelImg">
			<div>
			<p class="user-name">권재현님</p>
			<a href="/mypage/user-modify">회원정보 변경</a><br>
			<a href="/mypage/user-delivery">배송지 관리</a>
			</div>
		</div>
		<div class="user-menu">
			<ul class="flex">
				<li class="benefit">
					<p class="body1">혜택</p>
					<a href="/mypage/benefit" class="link-green "><span>0 장</span></a>
				</li>
				<li class="duczzi">
					<p class="body1">덕찌력</p>
					<a href="/mypage/badge/2022" class="link-green "><span>0</span></a>
				</li>
				<li class="question">
					<p class="body1">문의</p>
					<a href="/mypage/inquiry" class="link-green "><span>0 건</span></a>
				</li>
			</ul>
		</div>
	</div>
<!-- 상단 유저 정보 //-->

				<!-- 진행중인 주문 -->
				<div class="order-ing">
					<p class="sub-page-title">
						진행 중인 주문 <span class="body2">최근 30일 내에 진행중인 주문정보입니다.</span>
					</p>
					<ul class="flex">
						<li>
							<p>입금대기</p> <span id="waiting-deposit-count"><a
								href="javascript:;"
								onclick="searchOrder('waiting-deposit', this);">0</a></span>
						</li>
						<li>
							<p>결제완료</p> <span id="new-order-count"><a
								href="javascript:;" onclick="searchOrder('new-order', this)">0</a></span>
						</li>
						<li>
							<p>배송준비중</p> <span id="shipping-ready-count"><a
								href="javascript:;"
								onclick="searchOrder('shipping-ready', this)">0</a></span>
						</li>
						<li>
							<p>배송중</p> <!-- 0720 KMJ 배송중 내 교환배송중 포함 위에 변경 --> <span
							id="shipping-count"><a href="javascript:;"
								onclick="searchOrder('shipping-mypage', this);">0</a></span>
						</li>
						<li>
							<p>배송완료</p> <span id="confirm-shipping-count"><a
								href="javascript:;" onclick="searchOrder('35', this);">0</a></span>
						</li>
						<li>
							<p>구매확정</p> <span id="confirm-count"><a
								href="javascript:;" onclick="searchOrder('confirm', this)">0</a></span>
						</li>
						<li>
							<ul>
								<li><span>취소</span> <span id="cancel-process-count"><a
										href="javascript:;"
										onclick="searchOrder('cancel-process', this);" class="on">1</a></span></li>
								<li><span>교환</span> <span id="exchange-process-count"><a
										href="javascript:;"
										onclick="searchOrder('exchange-process', this);">0</a></span></li>
								<li><span>반품</span> <span id="return-process-count"><a
										href="javascript:;"
										onclick="searchOrder('return-process', this);">0</a></span></li>
							</ul>
						</li>
					</ul>
				</div>
				<!-- 진행중인 주문 //-->

				<!-- 최근 주문 내역 -->
				<div class="order-recently">
					<p class="sub-page-title">
						최근 주문내역 <span class="body2">최근 30일 내에 주문하신 내역입니다.</span>
					</p>
					<div class="table-wrap">

						<div class="table-top">
							<p class="sub-page-title">일반배송</p>
							<p>
								<span>주문일 : 2022-12-20</span> / <span>주문번호 : <a
									href="/mypage/order-detail/0/K1000079212">K1000079212</a></span>
							</p>
							<a href="/mypage/order/1" class="link">상세보기</a>
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
									<td><img src="/upload/item/1000001178/20221212162556XS.png" alt="일반배송상품"></td>
									<td>
										<p class="name">사쿠라</p>
										<p class="cate">보디 스프레이</p>
										<p class="cate"></p>
									</td>
									<td>￦ 70,000</td>
									<td>1개</td>
									<td class="complete">취소완료</td>
									<td>
										<div class="btn-wrap xsmall right">
											<a href="/mypage/order-detail/0/K1000079212/0"	class="border-btn">내역보기</a>
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
				</div>
				<!-- 최근 주문 내역 //-->

				<!-- 최근본 제품 -->
				<div class="prd-recently" id="recentItemList">
					<p class="sub-page-title">최근 본 제품 
					<span>최근 30일 이내에 보신 제품입니다.</span>
					</p>
					<ul class="flex">
						<li id="recent_item_41">
							<a href="/products/view/41" class="prd-image">
								<img src="/upload/item/41/20221109155824S.png" alt="섹스 밤">
							</a>
							<div class="buttons">
								<button type="button" onclick="addToMypageWishList('41');">
									<img src="/content/renewal/pc/images/ico/favourites.svg" alt="좋아요 버튼">
								</button>
								<button type="button" onclick="Shop.addToCart('41', '1', '1', 'false', '', '1', 'false', 'N')">
									<img src="/content/renewal/pc/images/ico/bag.svg" alt="장바구니 버튼">
								</button>
							</div>
							<a href="javascript:;" class="prd-name subtitle">섹스 밤</a>
							<div class="hashBox">
								<a href="#none">#로맨틱,#섹시한밤,#일랑일랑꽃</a>
							</div>
							<a href="javascript:;" class="prd-price">₩14,000</a>
							<button type="button" class="del-btn" data-class="prd-delete" onclick="deleteConfirm('41');">
								<img src="/content/renewal/pc/images/ico/ico_close_x.svg" width="15px" height="15px" alt="최근본 제품 삭제 버튼">
							</button>
						</li>
						<li id="recent_item_18"><a href="/products/view/18"	 class="prd-image">
							<img src="/upload/item/18/20211007143104S.png" alt="더 컴포터"></a>
							<div class="buttons">
								<button type="button" onclick="addToMypageWishList('18');">
									<img src="/content/renewal/pc/images/ico/favourites.svg" alt="좋아요 버튼">
								</button>
								<button type="button" onclick="Shop.addToCart('18', '1', '1', 'false', '', '1', 'false', 'N')">
									<img src="/content/renewal/pc/images/ico/bag.svg" alt="장바구니 버튼">
								</button>
							</div>
							<a href="javascript:;" class="prd-name subtitle">더 컴포터</a>
							<div class="hashBox">
								<a href="#none">#영화속주인공처럼,#거품입욕로망</a>
							</div>
							<a href="javascript:;" class="prd-price">₩19,000</a>
							<button type="button" class="del-btn" data-class="prd-delete" onclick="deleteConfirm('18');">
								<img src="/content/renewal/pc/images/ico/ico_close_x.svg" width="15px" height="15px" alt="최근본 제품 삭제 버튼">
							</button>
						</li>
					<li id="recent_item_85">
						<a href="/products/view/85" class="prd-image"><img src="/upload/item/85/20211008135544S(1).png" alt="허벌리즘 100g/250g"></a>
					 	<div class="buttons">
					 		<button type="button" onclick="addToMypageWishList('85');">
					 			<img src="/content/renewal/pc/images/ico/favourites.svg" alt="좋아요 버튼">
					 		</button>
					 		<button type="button" onclick="Shop.addToCart('85', '1', '1', 'false', '', '1', 'false', 'Y')">
					 			<img src="/content/renewal/pc/images/ico/bag.svg" alt="장바구니 버튼">
					 		</button>
						</div>
						<a href="javascript:;" class="prd-name subtitle">허벌리즘 100g/250g</a>
						<div class="hashBox">
							<a href="#none">#클렌저,#부드러운아침세안</a>
						</div>
						<a href="javascript:;" class="prd-price">₩22,000</a>
							<button type="button" class="del-btn" data-class="prd-delete" onclick="deleteConfirm('85');">
								<img src="/content/renewal/pc/images/ico/ico_close_x.svg" width="15px" height="15px" alt="최근본 제품 삭제 버튼">
							</button>
					</li>
					<li id="recent_item_65">
						<a href="/products/view/65" class="prd-image">
						<img src="/upload/item/65/20211008133548S.png" alt="오션 솔트 120g/250g">
						</a>
						<div class="buttons">
							<button type="button" onclick="addToMypageWishList('65');">
								<img src="/content/renewal/pc/images/ico/favourites.svg" alt="좋아요 버튼">
							</button>
							<button type="button" onclick="Shop.addToCart('65', '1', '1', 'false', '', '1', 'false', 'Y')">
								<img src="/content/renewal/pc/images/ico/bag.svg" alt="장바구니 버튼">
							</button>
						</div>
						<a href="javascript:;" class="prd-name subtitle">오션 솔트 120g/250g</a>
						<div class="hashBox">
							<a href="#none">#스크럽,#소금의건강한에너지</a>
						</div>
							<a href="javascript:;" class="prd-price">₩28,000</a>
							<button type="button" class="del-btn" data-class="prd-delete" onclick="deleteConfirm('65');">
								<img src="/content/renewal/pc/images/ico/ico_close_x.svg" width="15px" height="15px" alt="최근본 제품 삭제 버튼">
							</button>
						</li>
					</ul>
				</div>
					<!-- 최근본 제품 //-->
		</article>
		<!-- 마이페이지 우측 컨텐츠 영역 //-->
	</div>
</section>

<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

<script>

</script>
</body>
</html>