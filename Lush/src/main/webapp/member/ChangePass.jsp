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
<title>Insert title here</title>
</head>
<body>

비밀번호 변경 창입니다.

<form action="/Lush/member/changepass.do" method="GET">
<input type="hidden" name="id" value="<%=(String)request.getAttribute("findid")%>">
<input type="password" name="pass1" placeholder="비번">
<input type="password" name="pass2" placeholder="비번 확인">
<button type="submit">비밀번호 변경하기</button>
</form>

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