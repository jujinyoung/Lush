
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
  <%
    String msg = (String)request.getAttribute("msg");
    System.out.println(" 다시 로그인 페이지 돌아옴 ");
    Cookie[] c = request.getCookies();
    String cookieVal="";
    if(c!=null){
        for(Cookie i:c){
            if(i.getName().equals("save_id")){
                cookieVal=i.getValue();
            }
        }
    }
    
%>

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

<a href="Login2.jsp">로그인 페이지</a>

<script>
</script>
</body>
</html>