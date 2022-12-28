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

<%-- <jsp:include page="header.jsp"></jsp:include> --%>

<section id="mypage" class="my-page" style="padding-top: 128px;">
<div class="inner flex top">
	<!-- 마이페이지 좌측 메뉴 //-->
<jsp:include page="/managerpage/managerLeft.jsp"></jsp:include>

	<!-- 마이페이지 우측 컨텐츠 영역 -->
	<article class="my-contents main-page">

	<!-- 현재년도 -->
	<!-- 상단 유저 정보 -->
	<div class="user-box flex">
		<div class="user-info flex center">
	    	<img src="https://www.lush.co.kr/upload/user_level/1/Logo%20(1).png" alt="levelImg">
			<div>
			<p class="user-name">관리자님</p>
			<a href="/mypage/user-modify">제품 관리</a><br>
			<a href="/mypage/user-delivery">주문 관리</a>
			</div>
		</div>
		<div class="user-menu">
			<ul class="flex">
				<li class="question">
					<p class="body1"></p>
					<a href="/mypage/inquiry" class="link-green "><span></span></a>
				</li>
			</ul>
		</div>
	</div>
<!-- 상단 유저 정보 //-->
<!-- 
				진행중인 주문
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
							<p>배송중</p> 0720 KMJ 배송중 내 교환배송중 포함 위에 변경 <span
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
				진행중인 주문 //

				 -->
		</article>
		<!-- 마이페이지 우측 컨텐츠 영역 //-->
	</div>
</section>

<jsp:include page="/WEB-INF/inc/footer.jsp"></jsp:include>

<script>

</script>
</body>
</html>