<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link href="css/SignUpSucc_style.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" sizes="192x192" href="/Lush/images/ico/fabicon.png">
<title>러쉬코리아</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
</style>
</head>
<body>



<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
<section id="welcome" class="welcome" style="padding-top: 128px;">
	<div class="page-top">
		<h2 class="page-title">회원가입</h2>
	</div>
	<div class="inner">
		<article class="join-step">
			<ul class="flex center">
				<li>약관동의</li>
				<li>정보입력</li>
				<li class="on">가입완료</li>
			</ul>
		</article>
		<p class="welcome-message">환영합니다</p>
		<p class="body1">
		

					LUSH 회원가입을 축하 드립니다.<br>로그인 후 러쉬의 다양한 서비스를 이용하실 수 있습니다.
			
		</p>
		<div class="btn-wrap large">
			<a href="/Lush/member/LoginMain.jsp" class="black-btn">로그인</a>
		</div>
	</div>
</section>





<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>



<script>
</script>
</body>
</html>