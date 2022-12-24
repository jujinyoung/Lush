<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
      request.setCharacterEncoding("UTF-8");
      String contextPath = request.getContextPath();
      session.setAttribute("auth", "test1" );
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>LUSH</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
</head>
<body>

<a href="<%= contextPath %>/order/orderview.do">링크</a>

<script>
  $("a").on("click", function (){
	  $(this).attr("href", function (i, val){
		  return val +"?pid="+"1"+"&weight="+"150"+"&amount="+"2";
	  });
  });
</script>
</body>
</html>