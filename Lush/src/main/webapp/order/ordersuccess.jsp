<%@ page import="java.sql.*"%>
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
<title>LUSH</title>
<link rel="stylesheet" href="css/ordersuccess_style.css" type="text/css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>

<!-- iamport.payment.js -->
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<link rel="icon" type="image/png" sizes="192x192"
	href="/Lush/images/ico/fabicon.png">

</head>
<body>
	<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>

	<section id="order-complete" class="complete-page"
		style="padding-top: 128px;">
		<!-- GA4 필요정보 -->
		<input type="hidden" id="emailAddress" value="okol4561@naver.com">

		<div class="complete-inner">
			<h2>주문 완료</h2>

			<p class="complete-text">
				고객님의 주문이 완료되었습니다.<br> 주문하신 내역은 <a
					href="<%=contextPath%>/mypage/mypage.do">마이페이지</a>에서 가능합니다. <span
					class="addon">비회원은 주문 정보로 로그인하여 주문내역을 확인할 수 있습니다.</span>
			</p>
			<div class="btn-wrap large double">
				<a href="<%=contextPath%>/index.do" class="border-btn">계속
					쇼핑하기</a> <a href="<%=contextPath%>/mypage/mypage.do"
					class="black-btn">주문내역 조회</a>
			</div>
		</div>

	</section>
	<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>


</body>

</html>