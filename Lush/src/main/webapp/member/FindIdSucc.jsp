
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
 request.setCharacterEncoding("UTF-8");
 String findid = (String)request.getAttribute("findid");
 String findname = (String)request.getAttribute("findname");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 성공</title>
<link href="css/FindIdSucc_style.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" sizes="192x192" href="/Lush/images/ico/fabicon.png">
<title>러쉬코리아</title>
</head>
<body>
<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
<section id="resultId" style="padding-top: 128px;">
	<div class="inner">
		<article class="join-wrap">
			<div class="page-top">
				<h2 class="page-title-small">아이디 찾기</h2>
			</div>
			<div class="result-box">
			
				<%= findname %> 회원님의 아이디는<br>
				<strong><%= findid %></strong>입니다.
			</div>
			<ul class="login-opt flex center">
				<li><a href="FindPassPre.jsp">비밀번호 찾기</a></li>
				<li><a href="LoginMain.jsp">로그인 하기</a></li>
			</ul>
			</article>
	</div>
</section>
<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>

</body>
</html>