<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- <%
String id = (String)request.getSession().getAttribute("authUser");

%> --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title></title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<style>
</style>
</head>
<body>
메인(로그인) - 테스트용

<c:if test="${!empty authUser }">
	${authUser.name }님 안녕하세요 
	<!-- <a href="logout.do">로그아웃하기</a> -->
</c:if>
<c:if test="${empty authUser }">

	<a href="SignUp.jsp">회원가입하기</a>
</c:if>


<script>
</script>
</body>
</html>