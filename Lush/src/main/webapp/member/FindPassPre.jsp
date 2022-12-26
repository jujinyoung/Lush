<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/FindPassPre_style.css" rel="stylesheet" type="text/css">
<title></title>
<style>
</style>
</head>
<body>

<section id="searchPw" style="padding-top: 128px;">
	<div class="inner">
		<article class="join-wrap">
			<div class="page-top">
				<h2 class="page-title-small">비밀번호 찾기</h2>
			</div>
			<div class="search-wrap">
				<form id="authForm" method="post" action="/Lush/member/mail.do">
					<input type="hidden" id="authType" name="authType">
					<input type="text" name="id" placeholder="아이디">
					<input type="text" name="email" placeholder="이메일">
					<button type="submit" id="nextBtn" class="black-btn large-btn">비밀번호 찾기</button>
				<div><input type="hidden" name="_csrf" value="96f52a54-18f2-4216-84c8-f2380fec3c3c"></div></form>
				<ul class="login-opt">
					<li><a href="SignUpMain.jsp">회원가입</a></li>
					<li><a href="FindId.jsp">아이디찾기</a></li>
				</ul>
				</div>
		</article>
	</div>
</section>

 <!-- 비정상적일 경우 
 
 alert -> 아이디가 없습니다 
  -->
<script>
</script>
</body>
</html>