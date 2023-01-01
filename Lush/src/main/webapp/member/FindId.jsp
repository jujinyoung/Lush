<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/FindId_style.css" rel="stylesheet" type="text/css">
<style>
</style>
</head>
<body>
<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
<section id="searchId" style="padding-top: 128px;">
	<div class="inner">
		<article class="join-wrap">
			<div class="page-top">
				<h2 class="page-title-small">아이디 찾기</h2>
			</div>
			<div class="search-wrap">
				<form id="authForm" action="/Lush/member/findid.do" method="post">
					<input type="text" id="name" name="name" placeholder="이름">
					<input type="text" id="email" name="email" placeholder="가입 메일 주소">
					<button type="submit" id="" class="black-btn large-btn">아이디 찾기</button>
				<div><input type="hidden" name="_csrf" value="96f52a54-18f2-4216-84c8-f2380fec3c3c"></div></form>
				<ul class="login-opt">
					<li><a href="FindPassPre.jsp">비밀번호 찾기</a></li>
					<li><a href="LoginMain.jsp">로그인 하기</a></li>
				</ul>
			</div>
		</article>
	</div>
</section>
<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>


<script>


<c:if test="${errors.namenull}">
	alert('이름을 입력해 주세요.');
</c:if>

<c:if test="${errors.emailnull}">
alert('이메일을 입력해 주세요.');
</c:if>

<c:if test="${errors.nomember}">
alert('일치하는 회원이 없습니다.');
</c:if>


</script>
</body>
</html>