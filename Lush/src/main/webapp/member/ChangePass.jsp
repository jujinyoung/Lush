<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	String id = (String)request.getParameter("certificationCo");
// hidden 값에서 받아도 됨. 
	%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link href="css/ChangePass_style.css" rel="stylesheet" type="text/css">
<link rel="icon" type="image/png" sizes="192x192" href="/Lush/images/ico/fabicon.png">
<title>러쉬코리아</title>
</head>
<body>

<jsp:include page="/WEB-INF/inc/headerfooter/header.jsp"></jsp:include>
<section id="searchPw" style="padding-top: 128px;">
	<div class="inner">
		<article class="join-wrap">
			<div class="page-top">
				<h2 class="page-title-small">비밀번호 변경</h2>
			</div>
			<div class="search-wrap">
				<form id="authForm" method="GET" action="/Lush/member/changepass.do" >
					<input type="hidden" name="id" value="<%=(String)request.getAttribute("findid")%>">
					<input type="password" name="pass1" placeholder="비밀번호">
					<input type="password" name="pass2" placeholder="비밀번호 확인">
					<button type="submit" id="nextBtn" class="black-btn large-btn">비밀번호 변경하기</button>
				<div><input type="hidden" name="_csrf" value="96f52a54-18f2-4216-84c8-f2380fec3c3c"></div></form>
				</div>
		</article>
	</div>
</section>

<jsp:include page="/WEB-INF/inc/headerfooter/footer.jsp"></jsp:include>



<script>
<c:if test="${errors.passnotmatch}">
alert('비밀번호가 일치하지 않습니다.');
</c:if>

<c:if test="${errors.pass1null}">
alert('비밀번호를 입력해 주세요');
</c:if>

<c:if test="${errors.pass2null}">
alert('비밀번호 확인을 입력해 주세요');
</c:if>

</script>
</body>
</html>