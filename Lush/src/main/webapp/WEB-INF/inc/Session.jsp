<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% 
	String loginid = (String)session.getAttribute("loginid");
	if(loginid==null) {
%>
	<script>
		alert("로그인한 사용자만 사용가능한 화면입니다.");
		location.href="login.jsp";
	</script>
<% 
	}
%>