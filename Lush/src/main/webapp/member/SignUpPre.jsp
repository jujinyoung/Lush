<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="192x192" href="/Lush/images/ico/fabicon.png">
<title>러쉬코리아</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/SignUpPre_style.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>
 <jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
<section id="join" style="padding-top: 128px;">
	<div class="inner">
		<article class="join-wrap">
			<div class="page-top">
				<h2 class="page-title-small">회원가입</h2>
			</div>
			<div class="sns-btns">
				<a href="SignUp.jsp" class="black-btn">홈페이지 회원가입</a>
			</div>
			<span>이미 쇼핑몰 회원이세요?</span>
			<a href="LoginMain.jsp" class="go-login">로그인</a>
		</article>
	</div>
</section>
<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>

<script>
</script>
</body>
</html>